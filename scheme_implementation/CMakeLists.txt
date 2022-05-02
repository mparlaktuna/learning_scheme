cmake_minimum_required (VERSION 2.8.11)
project (rumi-scheme)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories("include")
add_executable(${PROJECT_NAME} src/main.cpp)
