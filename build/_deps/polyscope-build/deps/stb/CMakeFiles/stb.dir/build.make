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
include _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/progress.make

# Include the compile flags for this target's objects.
include _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/flags.make

_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/codegen:
.PHONY : _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/codegen

_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/stb_impl.cpp.o: _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/flags.make
_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/stb_impl.cpp.o: _deps/polyscope-src/deps/stb/stb_impl.cpp
_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/stb_impl.cpp.o: _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/stb_impl.cpp.o"
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build/deps/stb && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/stb_impl.cpp.o -MF CMakeFiles/stb.dir/stb_impl.cpp.o.d -o CMakeFiles/stb.dir/stb_impl.cpp.o -c /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-src/deps/stb/stb_impl.cpp

_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/stb_impl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/stb.dir/stb_impl.cpp.i"
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build/deps/stb && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-src/deps/stb/stb_impl.cpp > CMakeFiles/stb.dir/stb_impl.cpp.i

_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/stb_impl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/stb.dir/stb_impl.cpp.s"
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build/deps/stb && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-src/deps/stb/stb_impl.cpp -o CMakeFiles/stb.dir/stb_impl.cpp.s

# Object files for target stb
stb_OBJECTS = \
"CMakeFiles/stb.dir/stb_impl.cpp.o"

# External object files for target stb
stb_EXTERNAL_OBJECTS =

_deps/polyscope-build/deps/stb/libstb.a: _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/stb_impl.cpp.o
_deps/polyscope-build/deps/stb/libstb.a: _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/build.make
_deps/polyscope-build/deps/stb/libstb.a: _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libstb.a"
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build/deps/stb && $(CMAKE_COMMAND) -P CMakeFiles/stb.dir/cmake_clean_target.cmake
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build/deps/stb && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/build: _deps/polyscope-build/deps/stb/libstb.a
.PHONY : _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/build

_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/clean:
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build/deps/stb && $(CMAKE_COMMAND) -P CMakeFiles/stb.dir/cmake_clean.cmake
.PHONY : _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/clean

_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/depend:
	cd /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-src/deps/stb /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build/deps/stb /home/corto/Documents/Devoirs/2024-2025/S2/ComputerGraphics/CGDI-Practicals/build/_deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : _deps/polyscope-build/deps/stb/CMakeFiles/stb.dir/depend

