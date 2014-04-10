# This is the Gear2D Creation Kit main cmake file, containing the top-level functionality.

message(STATUS "Welcome to the Gear2D Creation Kit!")
project(g2ck)
cmake_minimum_required(VERSION 2.8)

add_subdirectory(00-bootstrap)
add_subdirectory(01-gear2d)