# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/jarakcyc/work/promprog/code-generation/with-codegen

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jarakcyc/work/promprog/code-generation/with-codegen/build

# Utility rule file for generation.

# Include the progress variables for this target.
include CMakeFiles/generation.dir/progress.make

CMakeFiles/generation: x.hpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/jarakcyc/work/promprog/code-generation/with-codegen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Checking if re-generation is required"

x.hpp: ../gen.py
x.hpp: ../images/map.png
x.hpp: ../images/flower.jpg
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/jarakcyc/work/promprog/code-generation/with-codegen/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating array by mapping"
	python3 /home/jarakcyc/work/promprog/code-generation/with-codegen/gen.py /home/jarakcyc/work/promprog/code-generation/with-codegen/images/map.png /home/jarakcyc/work/promprog/code-generation/with-codegen/images/flower.jpg x.hpp

generation: CMakeFiles/generation
generation: x.hpp
generation: CMakeFiles/generation.dir/build.make

.PHONY : generation

# Rule to build all files generated by this target.
CMakeFiles/generation.dir/build: generation

.PHONY : CMakeFiles/generation.dir/build

CMakeFiles/generation.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/generation.dir/cmake_clean.cmake
.PHONY : CMakeFiles/generation.dir/clean

CMakeFiles/generation.dir/depend:
	cd /home/jarakcyc/work/promprog/code-generation/with-codegen/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jarakcyc/work/promprog/code-generation/with-codegen /home/jarakcyc/work/promprog/code-generation/with-codegen /home/jarakcyc/work/promprog/code-generation/with-codegen/build /home/jarakcyc/work/promprog/code-generation/with-codegen/build /home/jarakcyc/work/promprog/code-generation/with-codegen/build/CMakeFiles/generation.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/generation.dir/depend

