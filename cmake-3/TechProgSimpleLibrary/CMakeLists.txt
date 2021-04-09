cmake_minimum_required(VERSION 3.0)
project(SimpleLibrary)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_INSTALL_PREFIX ${SimpleLibrary_SOURCE_DIR}/install)

set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

# set(TOOLS ${SimpleLibrary_SOURCE_DIR}/gcc-linaro-7.5.0-2019.12-i686_arm-linux-gnueabihf)
set(CMAKE_C_COMPILER ${TOOLS}/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${TOOLS}/bin/arm-linux-gnueabihf-g++)

include_directories(include)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib)
add_subdirectory(src)
add_executable(Main main.cpp)
add_executable(MainLib main_lib.cpp)

target_link_libraries(MainLib buffer)

install(
	TARGETS Main MainLib buffer
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
)