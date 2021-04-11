cmake_minimum_required(VERSION 3.0)
project(SimpleLibrary)

if (${ARM})
	set(CMAKE_SYSTEM_NAME Linux)
	set(CMAKE_SYSTEM_PROCESSOR arm)

	set(CMAKE_C_COMPILER ${TOOLS}/bin/arm-linux-gnueabihf-gcc)
	set(CMAKE_CXX_COMPILER ${TOOLS}/bin/arm-linux-gnueabihf-g++)
endif()

set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib")
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

include_directories(include)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${SimpleLibrary_SOURCE_DIR}/lib)
add_subdirectory(src)
add_executable(Main main.cpp)
add_executable(MainLib main_lib.cpp)

target_link_libraries(MainLib buffer)

install (
	DIRECTORY include/
	DESTINATION include
)

install(
	TARGETS Main MainLib buffer
	RUNTIME DESTINATION bin
	LIBRARY DESTINATION lib
)