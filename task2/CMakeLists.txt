cmake_minimum_required(VERSION 2.8)

project(CMakeProject)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${PROJECT_SOURCE_DIR}/bin")

include_directories(.)
add_subdirectory(B)

add_custom_command(
  OUTPUT index.h
  COMMAND python3 ${PROJECT_SOURCE_DIR}/A/preparing.py
  DEPENDS A/preparing.py
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}/A/
  COMMENT "Generate index.h"
)

set(SOURCES C/main.cpp)

add_custom_target(RunGenerator DEPENDS index.h COMMENT "Checking if re-generation is required")

add_executable(C ${SOURCES})
add_dependencies(C RunGenerator)
target_link_libraries(C lib)

######################################

find_package(GTest REQUIRED)
find_package(Threads REQUIRED)

include_directories(${GTEST_INCLUDE_DIRS})

add_executable(CTest C/main_test.cpp)
target_link_libraries(CTest ${GTEST_LIBRARIES} Threads::Threads)
add_dependencies(CTest RunGenerator)
target_link_libraries(CTest lib)

enable_testing()
add_test(Test bin/CTest)
