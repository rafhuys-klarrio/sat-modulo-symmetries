# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/raf/Projects/vub/dmos/sat-modulo-symmetries

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build

# Include any dependencies generated for this target.
include src/CMakeFiles/smsdir.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include src/CMakeFiles/smsdir.dir/compiler_depend.make

# Include the progress variables for this target.
include src/CMakeFiles/smsdir.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/smsdir.dir/flags.make

src/CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/minimalityCheck_dir.cpp
src/CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o -MF CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o.d -o CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/minimalityCheck_dir.cpp

src/CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/minimalityCheck_dir.cpp > CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.i

src/CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/minimalityCheck_dir.cpp -o CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.s

src/CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/minimalityCheckCommon.cpp
src/CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o -MF CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o.d -o CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/minimalityCheckCommon.cpp

src/CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/minimalityCheckCommon.cpp > CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.i

src/CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/minimalityCheckCommon.cpp -o CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.s

src/CMakeFiles/smsdir.dir/sms.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/sms.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/sms.cpp
src/CMakeFiles/smsdir.dir/sms.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/smsdir.dir/sms.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/sms.cpp.o -MF CMakeFiles/smsdir.dir/sms.cpp.o.d -o CMakeFiles/smsdir.dir/sms.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/sms.cpp

src/CMakeFiles/smsdir.dir/sms.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/sms.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/sms.cpp > CMakeFiles/smsdir.dir/sms.cpp.i

src/CMakeFiles/smsdir.dir/sms.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/sms.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/sms.cpp -o CMakeFiles/smsdir.dir/sms.cpp.s

src/CMakeFiles/smsdir.dir/cadicalSMS.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/cadicalSMS.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/cadicalSMS.cpp
src/CMakeFiles/smsdir.dir/cadicalSMS.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/smsdir.dir/cadicalSMS.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/cadicalSMS.cpp.o -MF CMakeFiles/smsdir.dir/cadicalSMS.cpp.o.d -o CMakeFiles/smsdir.dir/cadicalSMS.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/cadicalSMS.cpp

src/CMakeFiles/smsdir.dir/cadicalSMS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/cadicalSMS.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/cadicalSMS.cpp > CMakeFiles/smsdir.dir/cadicalSMS.cpp.i

src/CMakeFiles/smsdir.dir/cadicalSMS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/cadicalSMS.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/cadicalSMS.cpp -o CMakeFiles/smsdir.dir/cadicalSMS.cpp.s

src/CMakeFiles/smsdir.dir/useful.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/useful.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/useful.cpp
src/CMakeFiles/smsdir.dir/useful.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/smsdir.dir/useful.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/useful.cpp.o -MF CMakeFiles/smsdir.dir/useful.cpp.o.d -o CMakeFiles/smsdir.dir/useful.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/useful.cpp

src/CMakeFiles/smsdir.dir/useful.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/useful.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/useful.cpp > CMakeFiles/smsdir.dir/useful.cpp.i

src/CMakeFiles/smsdir.dir/useful.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/useful.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/useful.cpp -o CMakeFiles/smsdir.dir/useful.cpp.s

src/CMakeFiles/smsdir.dir/connectedComponents.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/connectedComponents.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/connectedComponents.cpp
src/CMakeFiles/smsdir.dir/connectedComponents.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object src/CMakeFiles/smsdir.dir/connectedComponents.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/connectedComponents.cpp.o -MF CMakeFiles/smsdir.dir/connectedComponents.cpp.o.d -o CMakeFiles/smsdir.dir/connectedComponents.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/connectedComponents.cpp

src/CMakeFiles/smsdir.dir/connectedComponents.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/connectedComponents.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/connectedComponents.cpp > CMakeFiles/smsdir.dir/connectedComponents.cpp.i

src/CMakeFiles/smsdir.dir/connectedComponents.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/connectedComponents.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/connectedComponents.cpp -o CMakeFiles/smsdir.dir/connectedComponents.cpp.s

src/CMakeFiles/smsdir.dir/coloring.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/coloring.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/coloring.cpp
src/CMakeFiles/smsdir.dir/coloring.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object src/CMakeFiles/smsdir.dir/coloring.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/coloring.cpp.o -MF CMakeFiles/smsdir.dir/coloring.cpp.o.d -o CMakeFiles/smsdir.dir/coloring.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/coloring.cpp

src/CMakeFiles/smsdir.dir/coloring.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/coloring.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/coloring.cpp > CMakeFiles/smsdir.dir/coloring.cpp.i

src/CMakeFiles/smsdir.dir/coloring.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/coloring.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/coloring.cpp -o CMakeFiles/smsdir.dir/coloring.cpp.s

src/CMakeFiles/smsdir.dir/connectedChecker.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/connectedChecker.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/connectedChecker.cpp
src/CMakeFiles/smsdir.dir/connectedChecker.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object src/CMakeFiles/smsdir.dir/connectedChecker.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/connectedChecker.cpp.o -MF CMakeFiles/smsdir.dir/connectedChecker.cpp.o.d -o CMakeFiles/smsdir.dir/connectedChecker.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/connectedChecker.cpp

src/CMakeFiles/smsdir.dir/connectedChecker.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/connectedChecker.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/connectedChecker.cpp > CMakeFiles/smsdir.dir/connectedChecker.cpp.i

src/CMakeFiles/smsdir.dir/connectedChecker.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/connectedChecker.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/connectedChecker.cpp -o CMakeFiles/smsdir.dir/connectedChecker.cpp.s

src/CMakeFiles/smsdir.dir/planarity.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/planarity.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/planarity.cpp
src/CMakeFiles/smsdir.dir/planarity.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object src/CMakeFiles/smsdir.dir/planarity.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/planarity.cpp.o -MF CMakeFiles/smsdir.dir/planarity.cpp.o.d -o CMakeFiles/smsdir.dir/planarity.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/planarity.cpp

src/CMakeFiles/smsdir.dir/planarity.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/planarity.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/planarity.cpp > CMakeFiles/smsdir.dir/planarity.cpp.i

src/CMakeFiles/smsdir.dir/planarity.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/planarity.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/planarity.cpp -o CMakeFiles/smsdir.dir/planarity.cpp.s

src/CMakeFiles/smsdir.dir/coloringCheck.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/coloringCheck.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/coloringCheck.cpp
src/CMakeFiles/smsdir.dir/coloringCheck.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object src/CMakeFiles/smsdir.dir/coloringCheck.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/coloringCheck.cpp.o -MF CMakeFiles/smsdir.dir/coloringCheck.cpp.o.d -o CMakeFiles/smsdir.dir/coloringCheck.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/coloringCheck.cpp

src/CMakeFiles/smsdir.dir/coloringCheck.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/coloringCheck.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/coloringCheck.cpp > CMakeFiles/smsdir.dir/coloringCheck.cpp.i

src/CMakeFiles/smsdir.dir/coloringCheck.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/coloringCheck.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/coloringCheck.cpp -o CMakeFiles/smsdir.dir/coloringCheck.cpp.s

src/CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/forbiddenSubgraph.cpp
src/CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object src/CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o -MF CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o.d -o CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/forbiddenSubgraph.cpp

src/CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/forbiddenSubgraph.cpp > CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.i

src/CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/forbiddenSubgraph.cpp -o CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.s

src/CMakeFiles/smsdir.dir/universal.cpp.o: src/CMakeFiles/smsdir.dir/flags.make
src/CMakeFiles/smsdir.dir/universal.cpp.o: /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/universal.cpp
src/CMakeFiles/smsdir.dir/universal.cpp.o: src/CMakeFiles/smsdir.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object src/CMakeFiles/smsdir.dir/universal.cpp.o"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT src/CMakeFiles/smsdir.dir/universal.cpp.o -MF CMakeFiles/smsdir.dir/universal.cpp.o.d -o CMakeFiles/smsdir.dir/universal.cpp.o -c /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/universal.cpp

src/CMakeFiles/smsdir.dir/universal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/smsdir.dir/universal.cpp.i"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/universal.cpp > CMakeFiles/smsdir.dir/universal.cpp.i

src/CMakeFiles/smsdir.dir/universal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/smsdir.dir/universal.cpp.s"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src/universal.cpp -o CMakeFiles/smsdir.dir/universal.cpp.s

# Object files for target smsdir
smsdir_OBJECTS = \
"CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o" \
"CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o" \
"CMakeFiles/smsdir.dir/sms.cpp.o" \
"CMakeFiles/smsdir.dir/cadicalSMS.cpp.o" \
"CMakeFiles/smsdir.dir/useful.cpp.o" \
"CMakeFiles/smsdir.dir/connectedComponents.cpp.o" \
"CMakeFiles/smsdir.dir/coloring.cpp.o" \
"CMakeFiles/smsdir.dir/connectedChecker.cpp.o" \
"CMakeFiles/smsdir.dir/planarity.cpp.o" \
"CMakeFiles/smsdir.dir/coloringCheck.cpp.o" \
"CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o" \
"CMakeFiles/smsdir.dir/universal.cpp.o"

# External object files for target smsdir
smsdir_EXTERNAL_OBJECTS =

src/libsmsdir.a: src/CMakeFiles/smsdir.dir/minimalityCheck_dir.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/minimalityCheckCommon.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/sms.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/cadicalSMS.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/useful.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/connectedComponents.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/coloring.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/connectedChecker.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/planarity.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/coloringCheck.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/forbiddenSubgraph.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/universal.cpp.o
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/build.make
src/libsmsdir.a: src/CMakeFiles/smsdir.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking CXX static library libsmsdir.a"
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && $(CMAKE_COMMAND) -P CMakeFiles/smsdir.dir/cmake_clean_target.cmake
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/smsdir.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/smsdir.dir/build: src/libsmsdir.a
.PHONY : src/CMakeFiles/smsdir.dir/build

src/CMakeFiles/smsdir.dir/clean:
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src && $(CMAKE_COMMAND) -P CMakeFiles/smsdir.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/smsdir.dir/clean

src/CMakeFiles/smsdir.dir/depend:
	cd /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/raf/Projects/vub/dmos/sat-modulo-symmetries /home/raf/Projects/vub/dmos/sat-modulo-symmetries/src /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src /home/raf/Projects/vub/dmos/sat-modulo-symmetries/build/src/CMakeFiles/smsdir.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : src/CMakeFiles/smsdir.dir/depend

