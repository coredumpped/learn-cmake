cmake_minimum_required(VERSION 3.24)
project(multi-src)

set(SOURCE_FILES Main.cpp Hello.cpp)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})
