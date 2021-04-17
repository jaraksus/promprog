cmake_minimum_required(VERSION 2.8)

project(CodeGen)

find_package(OpenCV REQUIRED)

add_custom_command( 
	OUTPUT ${OUTPUT_FILE}
	COMMAND python3 ${PROJECT_SOURCE_DIR}/gen.py ${PROJECT_SOURCE_DIR}/${MAP_FILE} ${PROJECT_SOURCE_DIR}/${INPUT_FILE} ${OUTPUT_FILE}
	DEPENDS gen.py ${MAP_FILE} ${INPUT_FILE}
	COMMENT "Generating array by mapping"
)
add_custom_target(generation DEPENDS ${OUTPUT_FILE} COMMENT "Checking if re-generation is required" )


include_directories(${OpenCV_INCLUDE_DIRS})


SET(SOURCES main.cpp)


add_executable(main ${SOURCES})
add_dependencies(main generation)


target_link_libraries(main ${OpenCV_LIBS})


target_include_directories(main PRIVATE ${CMAKE_BINARY_DIR})