project(g2ck)
cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake-modules")
message(STATUS "Welcome to Gear2D Creation Kit!")

# Get the external root path
get_filename_component(EXTERNAL_ROOT ${CMAKE_BINARY_DIR}/../external ABSOLUTE)
message(STATUS "Using ${EXTERNAL_ROOT} to place installed packages")

# Find Gear2D
message(STATUS "Looking for a Gear2D install")
set(Gear2D_DIR ${EXTERNAL_ROOT}/lib/gear2d/cmake)
find_package(Gear2D QUIET)
if (Gear2D_FOUND)
  message(STATUS "Gear2D was found (version ${GEAR2D_VERSION})")
  
  # Guess if gear2d-components was installed
  if(NOT EXISTS ${GEAR2D_LIBRARY_DIR}/component)
    message(STATUS "Your Gear2D install seems to be missing standard components. They'll be built.")
    include(get-gear2d-components.cmake)
  endif()
else()
  message(STATUS "No Gear2D was found. It will be built, then.")
  include(get-gear2d.cmake) # get-gear2d.cmake should deal with any dependencies.
endif()

# Makes available a new-game target
include(new-game.cmake)