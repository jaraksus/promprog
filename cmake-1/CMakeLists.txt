cmake_minimum_required(VERSION 3.0)

project(Project)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall")

find_package(PythonInterp 3 REQUIRED)
find_package(GTest REQUIRED)

execute_process(
	COMMAND ${PYTHON_EXECUTABLE} preparing.py
	WORKING_DIRECTORY "${PROJECT_SOURCE_DIR}/A"
	RESULT_VARIABLE result
)

if (result)
	message("fail to execute preparing.py")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${Project_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${Project_SOURCE_DIR}/lib)

set(MAIN_SRC C/main.cpp)
set(MAIN_TEST_SRC C/main_test.cpp)
set(TESTS_SRC C/tests.cpp)

include_directories(.)
include_directories(${GTEST_INCLUDE_DIRS})

add_subdirectory(B)

add_executable(C ${MAIN_SRC})
target_link_libraries(C arithmetic)

add_executable(CTest ${MAIN_TEST_SRC} ${TESTS_SRC})
target_link_libraries(CTest ${GTEST_LIBRARIES} pthread arithmetic)