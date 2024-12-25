cmake_minimum_required(VERSION 3.24)
project(3-hello-raylib)

# Workaround for CLang and RayLib's compound literals See:
# https://github.com/raysan5/raylib/issues/1343
set(CMAKE_CXX_STANDARD 11)

# Dependencies
include(FetchContent)

set(RAYLIB_VERSION 4.5.0)

FetchContent_Declare(
  raylib
  URL https://github.com/raysan5/raylib/archive/refs/tags/${RAYLIB_VERSION}.tar.gz
      FIND_PACKAGE_ARGS
      ${RAYLIB_VERSION}
      EXACT)

set(BUILD_EXAMPLES
    OFF
    CACHE INTERNAL "")

FetchContent_MakeAvailable(raylib)

set(SOURCE_FILES src/Main.cpp)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME} raylib)

# Checks if OSX and links appropriate frameworks (Only required on MacOS)
if(APPLE)
  target_link_libraries(${PROJECT_NAME} "-framework IOKit")
  target_link_libraries(${PROJECT_NAME} "-framework Cocoa")
  target_link_libraries(${PROJECT_NAME} "-framework OpenGL")
endif()
