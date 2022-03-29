# CMakeList.txt : Top-level CMake project file, do global configuration
# and include sub-projects here.
#
cmake_minimum_required (VERSION 3.8)

set(PROJECT_NAME "{{project_name}}")

project (
	"42cursus-${PROJECT_NAME}"
	VERSION 0.1.0
)
enable_testing()

add_subdirectory(tests)
# add other subdirectories deps HERE

set(
	HEADER_FILES
	"${PROJECT_SOURCE_DIR}/${PROJECT_NAME}.h"
	# your other headers files
) 
set(
	SOURCE_FILES
	"${PROJECT_SOURCE_DIR}/${PROJECT_NAME}.c"
	# your other sources files
)

set(
	LIBS
	# your libs
)

set(
	INCLUDES
	"${PROJECT_SOURCE_DIR}/include"
	# other include folders
)

# Create static lib target
add_library(lib${PROJECT_NAME} STATIC ${HEADER_FILES} ${SOURCE_FILES})
target_link_libraries(libft PRIVATE ${LIBS})
target_include_directories(
	lib${PROJECT_NAME}
	PUBLIC
	"${INCLUDES}"
)

# Create executable target
add_executable(exe${PROJECT_NAME} ${HEADER_FILE_TESTS} "${PROJECT_SOURCE_DIR}/src/main.c")
target_link_libraries(exe${PROJECT_NAME} PRIVATE ${LIBS})
target_include_directories(
	exe${PROJECT_NAME}
	PRIVATE
	"${INCLUDES}"
)

# IDE tree view
source_group(
	"Header_Files"
	FILES ${HEADER_FILES}
)

source_group(
	"Source_Files"
	FILES ${SOURCE_FILES}
)
