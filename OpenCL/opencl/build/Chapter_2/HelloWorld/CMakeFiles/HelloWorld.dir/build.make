# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/luchenglin/opencl

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/luchenglin/opencl/build

# Include any dependencies generated for this target.
include Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/depend.make

# Include the progress variables for this target.
include Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/progress.make

# Include the compile flags for this target's objects.
include Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/flags.make

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o: Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/flags.make
Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o: ../Chapter_2/HelloWorld/HelloWorld.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/luchenglin/opencl/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o"
	cd /home/luchenglin/opencl/build/Chapter_2/HelloWorld && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/HelloWorld.dir/HelloWorld.o -c /home/luchenglin/opencl/Chapter_2/HelloWorld/HelloWorld.cpp

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/HelloWorld.dir/HelloWorld.i"
	cd /home/luchenglin/opencl/build/Chapter_2/HelloWorld && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/luchenglin/opencl/Chapter_2/HelloWorld/HelloWorld.cpp > CMakeFiles/HelloWorld.dir/HelloWorld.i

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/HelloWorld.dir/HelloWorld.s"
	cd /home/luchenglin/opencl/build/Chapter_2/HelloWorld && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/luchenglin/opencl/Chapter_2/HelloWorld/HelloWorld.cpp -o CMakeFiles/HelloWorld.dir/HelloWorld.s

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o.requires:
.PHONY : Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o.requires

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o.provides: Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o.requires
	$(MAKE) -f Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/build.make Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o.provides.build
.PHONY : Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o.provides

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o.provides.build: Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o

# Object files for target HelloWorld
HelloWorld_OBJECTS = \
"CMakeFiles/HelloWorld.dir/HelloWorld.o"

# External object files for target HelloWorld
HelloWorld_EXTERNAL_OBJECTS =

Chapter_2/HelloWorld/HelloWorld: Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o
Chapter_2/HelloWorld/HelloWorld: Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/build.make
Chapter_2/HelloWorld/HelloWorld: Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable HelloWorld"
	cd /home/luchenglin/opencl/build/Chapter_2/HelloWorld && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/HelloWorld.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/build: Chapter_2/HelloWorld/HelloWorld
.PHONY : Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/build

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/requires: Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/HelloWorld.o.requires
.PHONY : Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/requires

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/clean:
	cd /home/luchenglin/opencl/build/Chapter_2/HelloWorld && $(CMAKE_COMMAND) -P CMakeFiles/HelloWorld.dir/cmake_clean.cmake
.PHONY : Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/clean

Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/depend:
	cd /home/luchenglin/opencl/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/luchenglin/opencl /home/luchenglin/opencl/Chapter_2/HelloWorld /home/luchenglin/opencl/build /home/luchenglin/opencl/build/Chapter_2/HelloWorld /home/luchenglin/opencl/build/Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : Chapter_2/HelloWorld/CMakeFiles/HelloWorld.dir/depend

