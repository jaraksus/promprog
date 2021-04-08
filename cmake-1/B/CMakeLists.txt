cmake_minimum_required(VERSION 3.0)

project(arithmetic)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall")

set(SOURCE_LIB lib.cpp)

add_library(arithmetic SHARED ${SOURCE_LIB})