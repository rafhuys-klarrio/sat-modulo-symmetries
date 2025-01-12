#include "useful.h"
#include <fstream>
#include <sstream>
#include <iterator>
#include <boost/program_options.hpp>
namespace po = boost::program_options;

#include "sms.hpp"
#include "planarity.hpp"

#include "cadicalSMS.hpp"
#ifdef INCLUDE_CLINGO
#include "clingoSMS.hpp"
#endif

#include "coloring.h"
#include "coloringCheck.hpp"

#include "forbiddenSubgraph.hpp"
#include "connectedChecker.hpp"
#include "universal.hpp"

int fixedSubgraphSize; // for the sake of simplicity i made global variables
int nextFreeVariableUniversal;

int thickness2Frequency; // frequency for checking whether the graph has indeed thickness 2
int thickness2FrequencyMultigraph;
int planarityFrequency;
int coloringAlgo; // 0 = simple, 1 = DPLL, 2 = SAT

bool triangleVersion;
int triangleVars = 0; // starting point of triangle variables if used

int minIntersectionVar = 0; // starting point of intersection variables
bool useCadical = true;
int greedyColoring = 0;

bool generate_connected = false;

bool non010colorableAll;
bool hypercoloring;
int minChromaticNumber;

bool addPermutedColorings;

vector<int> forAllAsumptions; // variables which should be added als assumtpion to the solver
vector<vector<int>> forAllCNF;

clock_t startOfSolving;

vector<vector<pair<int, int>>> forbiddenSubgraphs; // a list of edge-lists, which give forbidden subgraphs
bool eliminateAllsubgraphs;

int main(int argc, char const **argv)
{
    std::ifstream cnfFile;
    std::ifstream dimacsFile;
    std::ifstream forAllFile;
    std::ifstream forAllFileQCIR;
    std::ifstream forAllFileQCIRAssumptions;
    std::ifstream forbiddenSubgraphFile;
    std::ifstream forbiddenInducedSubgraphFile;

    pair<int, int> minChomaticNumberSubgraph; // first give minimum chromatic number, second the size
    int minChromaticIndexHypergraph = 0;      // Minimum edge chromatic number of the hypergraph
    pair<int, int> rangeCubesTemp;

    SolverConfig config;
    config.quiet = false;

    // deactivate autoformating for options
    // clang-format off

    po::options_description output_opts("Output options");
    output_opts.add_options()
      ("help", "produce this help message")
      ("hide-graphs", po::bool_switch(&config.hideGraphs), "Count solutions without outputing them (they still have to be enumerated)")
      ("print-full-matrix", po::bool_switch(&config.printFullMatrix), "When printing graphs, print the full adjacency matrix (as opposed to just a list of edges)")
      ("print-fully-defined-graphs", po::bool_switch(&config.printFullyDefinedGraphs), "Print every encountered fully defined graph, even if it does not pass checks")
      ("print-full-model", po::bool_switch(&config.printFullModel), "Print the full model, i.e., all variable assignments")
      ("print-intermediate-stats", po::bool_switch(&config.printIntermediateStatistic), "Print intermediate statistics")
      ("print-stats", po::bool_switch(&config.printStats), "Print statistics after solving")
      ("print-added-clauses", po::value<std::string>()->notifier([&](const std::string &value)
                                                                      {
          config.addedClauses = fopen(value.c_str(), "w");
          if (!config.addedClauses)
              EXIT_UNWANTED_STATE }),
              "Print all custom-learned clauses to this file")
      ("print-partial", po::value<int>(&config.printPartiallyDefined), "The frequency with which to print partially defined graphs (0 means never)")
      ("proof", po::value<std::string>(&config.proofFile), "Output a proof to this file")
      ("hypergraph", po::bool_switch(&config.hypermode), "Assume the bipartite graph to represent a hypergraph (changes output format of graphs to python list of sets = hyperedges)")
      ("symClauses", po::value<std::string>()->notifier([&config](const std::string &value)
        {
            config.symBreakClausesFile = fopen(value.c_str(), "w");
            if (!config.symBreakClausesFile) {
                std::cerr << "Failed to open sym clauses file." << std::endl;
                std::exit(EXIT_FAILURE);
        } }), "Set file where symmetry breaking clauses should be stored");

    vector<int> initialPartitionArguments;
    po::options_description main_opts{"Main options"};

    main_opts.add_options()
#ifdef INCLUDE_CLINGO
      ("useClingo", po::bool_switch(&useCadical)->default_value(true), "Use Clingo instead of Cadical")
#endif
      ("cnf", po::value<std::string>(), "file with the CNF encoding of the wished for graphs, in a stripped-down format")
      ("dimacs", po::value<std::string>()->notifier([&dimacsFile](const std::string &value)
                                                           {
      dimacsFile.open(value);
      if (dimacsFile.fail()) {
          std::cerr << "Failed to open the DIMACS file." << std::endl;
          std::exit(EXIT_FAILURE);
      } }),
              "file containing the encoding for the wished for graphs, in DIMACS format")
      ("all-graphs", po::bool_switch(&config.allModels), "Generate all graphs until unsatisfiable (otherwise exit after first solution)")
      ("vertices,v", po::value<int>(&config.vertices), "Generate graphs with this number of vertices")
      ("bipartite,b", po::value<std::vector<int>>()->multitoken(), "Generate bipartite graphs with the specified partition sizes (partitions are non-interchangable). Use this option to generate hypergraphs represented as incidence graphs: the first partition are the vertices, the second are the hyperedges, and adjacency means containment of a vertex in a hyperedge.") // TODO
      ("multi-graph", po::value<int>(&config.numberOfOverlayingGraphs), "Not only create one graph, but the number of specified graphs")
      ("connected,c", po::bool_switch(&generate_connected), "Generate only connected graphs")
      ("forall", po::value<std::string>()->notifier([&forAllFile](const std::string &value)
                                                           {
      forAllFile.open(value);
      if (forAllFile.fail()) {
          std::cerr << "Failed to open forall file." << value << std::endl;
          std::exit(EXIT_FAILURE);
      } }),
              "File containing an universal property which should be ensured, i.e., the graphs are not allowed to satisfy the existential encoding given by the file.")
      ("forallQCIR", po::value<std::string>()->notifier([&forAllFileQCIR](const std::string &value)
                                                           {
      forAllFileQCIR.open(value);
      if (forAllFileQCIR.fail()) {
          std::cerr << "Failed to open forall file." << value << std::endl;
          std::exit(EXIT_FAILURE);
      } }),
              "File containing an universal property which should be ensured encoded with curcuits, i.e., the graphs are not allowed to satisfy the existential encoding given by the file.")
      ("forallQCIRAssumptions", po::value<std::string>()->notifier([&forAllFileQCIRAssumptions](const std::string &value)
                                                           {
      forAllFileQCIRAssumptions.open(value);
      if (forAllFileQCIRAssumptions.fail()) {
          std::cerr << "Failed to open forall file for assumptions." << std::endl;
          std::exit(EXIT_FAILURE);
      } }),
              "File containing the existential variables which should be forwarded as assumptions to the universal part.")


#ifdef GLASGOW
      ("forbidden-subgraphs", po::value<std::string>()->notifier([&forbiddenSubgraphFile](const std::string &value)
                                                                       {
          forbiddenSubgraphFile = std::ifstream(value);
          if (forbiddenSubgraphFile.fail()) {
              std::cerr << "Failed to open forbidden subgraphs file." << std::endl;
              std::exit(EXIT_FAILURE);
          } }),
              "File with a list of the forbidden subgraphs which will be excluded during search with the Glasgow subgraph isomorphism solver")
      ("forbidden-induced-subgraphs", po::value<std::string>()->notifier([&forbiddenInducedSubgraphFile](const std::string &value)
                                                                       {
          forbiddenInducedSubgraphFile = std::ifstream(value);
          if (forbiddenInducedSubgraphFile.fail()) {
              std::cerr << "Failed to open forbidden induced subgraphs file." << std::endl;
              std::exit(EXIT_FAILURE);
          } }),
              "same as above, only induced")
#endif
      ("no-SMS", po::bool_switch(&config.turnoffSMS), "Turn off SMS, i.e., no minimality check")
      ("initial-partition", po::value<std::vector<int>>(&initialPartitionArguments)->multitoken(),
              "Set the initial partition for the minimality check, given as a sequence of partition sizes (integers). The minimality check will look for permutations that preserve partition membership")
      ("vertex-orderings-file", po::value<std::string>(), "Specify the vertex orderings file")
      ("turn-off-inprocessing", po::bool_switch(&config.turnOffInprocessing), "Turn off Cadical's inprocessing")
      ("propagate-literals", po::bool_switch(&config.propagateLiteralsCadical), "Propagate literals")
      ("irredundant-sym-clauses", po::bool_switch(&config.irredundantSymClauses), "Mark symmetry-breaking clauses as irredundant")
      ("combine-static-dynamic", po::bool_switch(&config.combineStaticPlusDynamic), "Combine static with dynamic (SMS) symmetry breaking")
      ("planarity-frequency,planar", po::value<int>(&planarityFrequency), "The frequency with which to call the planarity check (0 means never)")
      ("thickness2", po::value<int>(&thickness2Frequency), "The frequency with which to test thickness two (0 means never)")
      ("thickness2multi", po::value<int>(&thickness2FrequencyMultigraph), "Frequency in which the second and third graph are tested for planarity")
      ("frequency-connected-components-swap,fc", po::value<int>(&config.frequencyConnectedComponentsSwap), "The frequency with which to call a special minimality check based on analysis of connected components")

      // ("intervallsColoring", po::value<std::vector<int>>()->multitoken()->zero_tokens(), "Specify the intervals coloring"); // TODO
      ("coloring-algo", po::value<int>(&coloringAlgo), "Specify the graph coloring algorithm (0 means simple recursive; 1 means simple DPLL-based; 2 means SAT-based)")
      ("greedy-coloring", po::value<int>(&greedyColoring), "Learn more general constraints that block a vertex ordering for the greedy coloring algorithm rather than just a single coloring")
      ("perm-colorings", po::bool_switch(&addPermutedColorings), "For coloring problems, perturb found coloring to learn additional coloring clauses from one graph")
      ("non-hyper-colorable,nh", po::bool_switch(&hypercoloring), "Search for non-2-colorable hypergraphs (must be combined with --bipartite)")
      ("non-hyper-edge-colorable,nhec", po::bool_switch(&config.hyperedgeColoring), "Search for hypergraphs that are not n-edge-colorable, where n is the number of vertices (relates to the EFL conjecture; equivalent to --minChromaticIndexHypergraph = --vertices + 1)")
      ("non-010-colorable,non010", po::bool_switch(&config.non010colorable), "Search for non-010-colorable graphs (relates to Kochen-Specker graphs)")
      ("non-010-colorable-all,non010-all", po::bool_switch(&non010colorableAll), "Enable non-010 colorable all option")
      ("triangle-version", po::bool_switch(&triangleVersion), "Request the creation of triangle variables")
      ("triangle-vars", po::value<int>(&triangleVars)->implicit_value(0), "For problems which use triangle variables (variable to denote whether a given set of 3 vertices forms a triangle), specify where the triangle variables start")
      ("min-chromatic-number,chi", po::value<int>(&minChromaticNumber)->implicit_value(0), "Search for graphs with chromatic number at least this")
      ("min-chromatic-index-hypergraph,chi-index-hyper", po::value<int>(&minChromaticIndexHypergraph)->implicit_value(0), "Search for hypergraphs with chromatic index at least this")
      ("min-intersection-var", po::value<int>(&minIntersectionVar), "For hypergraph problems which use the intersection graph, specify where the intersection variables start")
      ("min-chomatic-number-subgraph,chi-s", po::value<std::vector<int>>()->multitoken()->composing()->notifier([&minChomaticNumberSubgraph](const std::vector<int> &values)
                                                                                                               {
          if (values.size() == 2)
              minChomaticNumberSubgraph = std::make_pair(values[0], values[1]); }),
          "The value (k, s) means that the induced subgraph spanned by the vertices 0 .. s-1 should have chromatic number at least k")
      ("fixed-subgraph-size", po::value<int>(&fixedSubgraphSize), "Disable permuting vertices of the lowest k vertices (symmetry breaking becomes incomplete)");

    po::options_description perf_opts{"Performance options"};

    perf_opts.add_options()
      ("timeout,t", po::value<int>(&config.timeout), "Set a time limit for solving (seconds)")
      ("cutoff", po::value<int>(&config.cutoff), "Set cutoff for the minimality check")
      ("frequency,f", po::value<int>(&config.frequency), "Specify the frequency with which to call the minimality check (call every f-th propagation fixpoint)")
      ("assignment-scoring", po::value<int>(&config.assignmentScoring), "Set the assignment scoring scheme for cubing (0 means count assigned edge variables; 1 means count weighted by the frequency with which the assigned literals appeared in previous solutions)")
      ("assignment-cutoff", po::value<int>(&config.assignmentCutoff), "Set the assignment cutoff for cubing and activate cubing (as soon as the assignment score exceeds the cutoff, output a cube to be solved later, learn a clause to block the current assignment, and backtrack; see also assignment-scoring)")
      ("assignment-cutoff-prerun", po::value<int>(&config.assignmentCutoffPrerun), "Postpone cubing until the propagator has been called this many times (see also assignment-cutoff)")
      ("assignment-cutoff-prerun-time", po::value<long>(&config.assignmentCutoffPrerunTime), "Postpone cubing until this much time has elapsed (in seconds; see also assignment-cutoff)")
      ("cubes", po::value<std::string>(&config.cubeFile), "File containing a list of cubes to be solved")

      ("cube2solve", po::value<std::vector<int>>()->multitoken()->composing()->notifier([&rangeCubesTemp](const std::vector<int> &values)
                                                                                               {
          if (values.size() == 2)
              rangeCubesTemp = std::make_pair(values[0], values[1]); }),
              "Which cube should be solved (for external parallelization; see also --cubes)")
    ;


    // options("symClauses", po::value<std::string>()->notifier([&symBreakClausesFile](const std::string &value)
    //                                                                                                                                                                                                  {
    // symBreakClausesFile = fopen(value.c_str(), "w");
    // if (!symBreakClausesFile) {
    //     std::cerr << "Failed to open sym clauses file." << std::endl;
    //     std::exit(EXIT_FAILURE);
    // } })
    //  "Set sym clauses file")

    // ("coloringClauses", po::value<std::string>()->notifier([&addedColoringClauses](const std::string &value)
    //                                                        {
    // addedColoringClauses = fopen(value.c_str(), "w");
    // if (!addedColoringClauses) {
    //     std::cerr << "Failed to open coloring clauses file." << std::endl;
    //     std::exit(EXIT_FAILURE);
    // } }),
    //  "Set coloring clauses file")

    // clang-format on

    po::options_description all_opts("All options");
    all_opts.add(main_opts).add(perf_opts).add(output_opts);
    po::variables_map vm;
    try
    {
        po::store(po::parse_command_line(argc, argv, all_opts), vm);
        po::notify(vm);
    }
    catch (const po::unknown_option &e)
    {
        std::cout << "Error: Unknown option '" << e.get_option_name() << "'" << std::endl;
        std::cout << all_opts << std::endl;
        return EXIT_FAILURE;
    }

    if (vm.count("help"))
    {
        std::cout << all_opts << std::endl;
        return 0;
    }

    if (vm.count("bipartite"))
    {
        vector<int> b = vm["bipartite"].as<vector<int>>();
        config.b_vertices[0] = b[0];
        config.b_vertices[1] = b[1];

        config.set_vertices(config.b_vertices[0] + config.b_vertices[1]);
        /* initialize two partitions for the minimality check
         * custom partitions can be specified as well, they will
         * override the setting here. Be cerful to maintain consistency */
        config.initialPartition[0] = true;
        config.initialPartition[config.b_vertices[0]] = true;
    }
    else
    {
        config.set_vertices(config.vertices);
    }

    int vertices = config.vertices;

    // parse more complicated options
    if (vm.count("vertex-orderings-file"))
    {
        config.initialPartition = vector<bool>(vertices, false);
        config.initialPartition[0] = true;
        std::string filename = vm["vertexOrderingsFile"].as<std::string>();
        std::ifstream file(filename);
        if (!file)
        {
            std::cerr << "Error: Failed to open file '" << filename << "'" << std::endl;
            return 1;
        }

        std::string line;
        getline(file, line);
        std::istringstream iss(line);
        std::string space_delimiter = " ";
        std::string s;
        int curPos = 0;
        while (std::getline(iss, s, ' '))
        {
            config.initialPartition[curPos] = true;
            int step = std::stoi(s);
            curPos += step;
        }
        assert(vertices == curPos);
        while (getline(file, line))
        {
            if (line.substr(0, 2) == "c\t")
                continue;
            std::vector<int> initialVertexOrdering;
            std::istringstream iss(line);
            std::string space_delimiter = " ";
            std::string s;
            while (std::getline(iss, s, ' '))
            {
                int l = std::stoi(s);
                initialVertexOrdering.push_back(l);
            }
            config.initialVertexOrderings.push_back(initialVertexOrdering);
        }
    }

    config.rangeCubes = rangeCubesTemp;

    if (!initialPartitionArguments.empty())
    {
        assert(vertices != 0);
        int curPos = 0;
        for (const int &value : initialPartitionArguments)
        {
            config.initialPartition[curPos] = true;
            curPos += value;
        }
        assert(vertices == curPos);
        // Perform additional checks if needed
    }

    if (config.non010colorable || non010colorableAll)
        triangleVersion = true;

    // ASSIGN DEFAULTS
    // if no custom chromatic number is assigned, automatically assume we are looking for chromatic number at least n+1
    if (config.hyperedgeColoring && minChromaticNumber == 0)
    {
        minChromaticIndexHypergraph = config.b_vertices[0] + 1;
        printf("WARNING: automatically setting minimum edge chromatic number to chi = %d\n", minChromaticIndexHypergraph);
    }

    printf("Number of vertices: %d\n", vertices);

    assert(!config.initialPartition.empty());
    assert(config.initialPartition.size() == vertices);

    if (fixedSubgraphSize != 0)
    {
        for (int i = 0; i < fixedSubgraphSize; i++)
            config.initialPartition[i] = true;

        if (fixedSubgraphSize < vertices)
            config.initialPartition[fixedSubgraphSize] = true;
    }

    printf("Initial partition:");
    for (auto b : config.initialPartition)
        printf("%d ", b ? 1 : 0);
    printf("\n");

    // config.nextFreeVariable = 1;
    cnf_t cnf;

    if (config.numberOfOverlayingGraphs)
        config.init_multi_edge_vars();

#ifndef DIRECTED
    if (minIntersectionVar)
    {
        config.init_intersection_vars(minIntersectionVar); // TODO only call when needed?
        if (!useCadical)
            for (int i = 0; i < config.b_vertices[1]; i++)
                for (int j = i + 1; j < config.b_vertices[1]; j++)
                    cnf.push_back({config.edges_intersection_graph[i][j], -config.edges_intersection_graph[i][j]}); // trivial clauses but need the variables. TODO find better solution
    }

    if (!useCadical)
        for (int i = 0; i < vertices; i++)
            for (int j = i + 1; j < vertices; j++)
                cnf.push_back({config.edges[i][j], -config.edges[i][j]}); // trivial clauses but need the variables. TODO find better solution

#else
    if (!useCadical)
        for (int i = 0; i < vertices; i++)
            for (int j = 0; j < vertices; j++)
            {
                if (i == j)
                    continue;
                cnf.push_back({config.edges[i][j], -config.edges[i][j]}); // trivial clauses but need the variables. TODO find better solution
            }
#endif

    // TODO combineStaticPlusDynamic, triangleVersion or intersection graph are not compatable. Currently only one of them can be selected.

    if (config.combineStaticPlusDynamic)
    {
        config.staticPartition = vector<vector<lit_t>>(vertices, vector<lit_t>(vertices, 0));
        for (int i = 0; i < vertices; i++)
            for (int j = i + 1; j < vertices; j++)
            {
                config.staticPartition[i][j] = config.staticPartition[j][i] = config.nextFreeVariable++;
                config.observedVars.push_back(config.staticPartition[i][j]);
            }

        if (!useCadical)
        {
            EXIT_UNWANTED_STATE; // currently only supported for CADICAL
        }

        if (triangleVersion)
            EXIT_UNWANTED_STATE; // not compatable with triangle version

        if (config.b_vertices[0] != 0 || config.b_vertices[1] != 0)
            EXIT_UNWANTED_STATE // not compatable with intersection graph
    }

    if (triangleVersion)
    {
        config.init_triangle_vars(triangleVars);
        if (!useCadical)
            for (int i = 0; i < vertices; i++)
                for (int j = i + 1; j < vertices; j++)
                    for (int k = j + 1; k < vertices; k++)
                        cnf.push_back({config.triangles[i][j][k], -config.triangles[i][j][k]}); // trivial clauses but need the variables. TODO find better solution
    }

    // read cnf-file
    if (cnfFile.is_open())
    {
        string line;
        while (getline(cnfFile, line))
        {
            if (strncmp(line.c_str(), "c\t", 2) == 0)
                continue;
            std::istringstream iss(line);
            clause_t clause;
            string space_delimiter = " ";

            string lit;
            while (std::getline(iss, lit, ' '))
            {
                int l = stoi(lit);
                config.nextFreeVariable = std::max(config.nextFreeVariable, abs(l) + 1);
                clause.push_back(l);
            }
            cnf.push_back(clause);
        }
    }

    if (dimacsFile.is_open())
    {
        int maxVar;
        file2cnf(dimacsFile, cnf, maxVar);
        config.nextFreeVariable = std::max(config.nextFreeVariable, maxVar + 1);
    }

    // check if zero literal
    for (auto clause : cnf)
    {
        for (auto lit : clause)
            if (lit == 0)
                EXIT_UNWANTED_STATE
    }

    // solving part-------------------------

    printf("Clauses: %ld, Variables %d\n", cnf.size(), config.nextFreeVariable - 1);
    fflush(stdout);

    if (addPermutedColorings)
    {
        printf("Will permute colorings\n");
    }

    GraphSolver *solver;

    if (useCadical)
    {
        printf("SAT Solver: Cadical\n");
        solver = new CadicalSolver(config, cnf); // TODO check if highest variable also highest according to triangle variables and other stuff
    }
    else
    {
#ifndef INCLUDE_CLINGO
        printf("Clingo not installed\n");
        EXIT_UNWANTED_STATE
#else
        printf("SAT Solver: Clingo\n");
        solver = new ClingoSolver(config, cnf);
#endif
    }

#ifndef DIRECTED
    if (planarityFrequency)
    {
        solver->addPartiallyDefinedGraphChecker(new PlanarityChecker(planarityFrequency));
    }
#else
    if (planarityFrequency)
    {
        solver->addPartiallyDefinedGraphChecker(new DirectedPlanarityChecker(planarityFrequency));
    }
#endif
    if (thickness2Frequency)
    {
        solver->addPartiallyDefinedGraphChecker(new ThicknessTwoChecker(thickness2Frequency));
    }

    if (thickness2FrequencyMultigraph)
    {
        solver->addPartiallyDefinedMultiGraphChecker(new ThicknessTwoCheckerMulti(thickness2FrequencyMultigraph));
    }

    if (minChomaticNumberSubgraph.first)
    {
        solver->addPartiallyDefinedGraphChecker(new SubgraphChromaticNumberChecker(30, minChomaticNumberSubgraph.second, minChomaticNumberSubgraph.first, coloringAlgo));
    }

    // checkers related to coloring
    if (config.non010colorable)
    {
        solver->addComplexFullyDefinedGraphChecker(new Non010colorableChecker(config.triangles, config.edges, &solver->triangle_stats, &solver->edge_stats));
    }

    if (minChromaticNumber)
    {
        solver->addComplexFullyDefinedGraphChecker(new MinChromaticNumberChecker(minChromaticNumber, coloringAlgo, config.edges, addPermutedColorings));
    }

    if (minChromaticIndexHypergraph)
    {
        solver->addComplexFullyDefinedGraphChecker(new HypergraphMinChromaticNumberChecker(minChromaticIndexHypergraph, coloringAlgo, config.edges_intersection_graph, config.b_vertices));
    }

    if (hypercoloring)
    {
        solver->addComplexFullyDefinedGraphChecker(new HyperColoringChecker(coloringAlgo, config.b_vertices, config.edges));
    }

    if (generate_connected)
    {
        solver->addFullyDefinedGraphChecker(new ConnectedChecker());
    }

#ifdef GLASGOW
    if (forbiddenSubgraphFile.is_open() || forbiddenInducedSubgraphFile.is_open())
    {
        int frequencyForbiddenSubgraphs = vertices > 2 ? vertices : 3;
        solver->addPartiallyDefinedGraphChecker(new ForbiddenSubgraphCheckerGlasgow(frequencyForbiddenSubgraphs, forbiddenSubgraphFile, forbiddenInducedSubgraphFile));
    }
#endif

    if (forAllFile.is_open())
    {
        // TODO for now the assumptions are just the undirected edge variables but make it more flexable in the future
        // !!!!!!!not for digraphs yet
        for (int i = 0; i < vertices; i++)
            for (int j = i + 1; j < vertices; j++)
            {
                forAllAsumptions.push_back(config.edges[i][j]);
            }
        solver->addComplexFullyDefinedGraphChecker(new UniversalChecker(forAllFile, forAllAsumptions));
    }

    if (forAllFileQCIR.is_open())
    {
        // assumptions are either the edge variables or specified in a seperate file
        if (forAllFileQCIRAssumptions.is_open())
        {
            std::string line;
            if (std::getline(forAllFileQCIRAssumptions, line))
            {
                std::istringstream iss(line);
                int num;
                while (iss >> num)
                    forAllAsumptions.push_back(num);

                // Now, the 'integers' vector contains all the integers from the first line
                // for (int num : forAllAsumptions)
                //     std::cout << num << " ";
                // std::cout << std::endl;
            }
            else
            {
                std::cerr << "The file is empty." << std::endl;
            }
            forAllFileQCIRAssumptions.close();
        }
        else
        {
            // !!!!!!!not for digraphs yet
            for (int i = 0; i < vertices; i++)
                for (int j = i + 1; j < vertices; j++)
                {
                    forAllAsumptions.push_back(config.edges[i][j]);
                }
        }
        solver->addComplexFullyDefinedGraphChecker(new UniversalCheckerQCIR(forAllFileQCIR, forAllAsumptions));
    }

    if (greedyColoring)
    {
        solver->addComplexFullyDefinedGraphChecker(new GreedyColoring(coloringAlgo, config.edges, greedyColoring));
    }
    solver->solve();

    printf("Total time: %f\n", ((double)clock() - solver->stats.start) / CLOCKS_PER_SEC);
    return 0;
}
