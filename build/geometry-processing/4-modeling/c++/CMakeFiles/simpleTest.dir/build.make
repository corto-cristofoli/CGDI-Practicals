# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

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
CMAKE_SOURCE_DIR = /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build

# Include any dependencies generated for this target.
include geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/compiler_depend.make

# Include the progress variables for this target.
include geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/progress.make

# Include the compile flags for this target's objects.
include geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/flags.make

geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/codegen:
.PHONY : geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/codegen

geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/simpleTest.cpp.o: geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/flags.make
geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/simpleTest.cpp.o: /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/geometry-processing/4-modeling/c++/simpleTest.cpp
geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/simpleTest.cpp.o: geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/simpleTest.cpp.o"
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/geometry-processing/4-modeling/c++ && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/simpleTest.cpp.o -MF CMakeFiles/simpleTest.dir/simpleTest.cpp.o.d -o CMakeFiles/simpleTest.dir/simpleTest.cpp.o -c /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/geometry-processing/4-modeling/c++/simpleTest.cpp

geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/simpleTest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/simpleTest.dir/simpleTest.cpp.i"
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/geometry-processing/4-modeling/c++ && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/geometry-processing/4-modeling/c++/simpleTest.cpp > CMakeFiles/simpleTest.dir/simpleTest.cpp.i

geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/simpleTest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/simpleTest.dir/simpleTest.cpp.s"
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/geometry-processing/4-modeling/c++ && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/geometry-processing/4-modeling/c++/simpleTest.cpp -o CMakeFiles/simpleTest.dir/simpleTest.cpp.s

# Object files for target simpleTest
simpleTest_OBJECTS = \
"CMakeFiles/simpleTest.dir/simpleTest.cpp.o"

# External object files for target simpleTest
simpleTest_EXTERNAL_OBJECTS =

geometry-processing/4-modeling/c++/simpleTest: geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/simpleTest.cpp.o
geometry-processing/4-modeling/c++/simpleTest: geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/build.make
geometry-processing/4-modeling/c++/simpleTest: geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/compiler_depend.ts
geometry-processing/4-modeling/c++/simpleTest: _deps/polyscope-build/src/libpolyscope.a
geometry-processing/4-modeling/c++/simpleTest: _deps/polyscope-build/deps/imgui/libimgui.a
geometry-processing/4-modeling/c++/simpleTest: _deps/polyscope-build/deps/glm/glm/libglm.a
geometry-processing/4-modeling/c++/simpleTest: _deps/polyscope-build/deps/glfw/src/libglfw3.a
geometry-processing/4-modeling/c++/simpleTest: /usr/lib/librt.a
geometry-processing/4-modeling/c++/simpleTest: /usr/lib/libm.so
geometry-processing/4-modeling/c++/simpleTest: /usr/lib/libX11.so
geometry-processing/4-modeling/c++/simpleTest: _deps/polyscope-build/deps/glad/src/libglad.a
geometry-processing/4-modeling/c++/simpleTest: _deps/polyscope-build/deps/stb/libstb.a
geometry-processing/4-modeling/c++/simpleTest: geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable simpleTest"
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/geometry-processing/4-modeling/c++ && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simpleTest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/build: geometry-processing/4-modeling/c++/simpleTest
.PHONY : geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/build

geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/clean:
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/geometry-processing/4-modeling/c++ && $(CMAKE_COMMAND) -P CMakeFiles/simpleTest.dir/cmake_clean.cmake
.PHONY : geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/clean

geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/depend:
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/geometry-processing/4-modeling/c++ /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/geometry-processing/4-modeling/c++ /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : geometry-processing/4-modeling/c++/CMakeFiles/simpleTest.dir/depend

