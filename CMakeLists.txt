cmake_minimum_required(VERSION 3.26)
project(sem11_llvm_hw01)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(third-party/SDL2)
include_directories(${PROJECT_NAME} "${CMAKE_SOURCE_DIR}/third-party/SDL2/include")

add_library(game STATIC game.h game.c)
add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} game SDL2::SDL2main SDL2::SDL2-static)
