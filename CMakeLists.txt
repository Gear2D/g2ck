project(g2ck)
cmake_minimum_required(VERSION 2.8)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake-modules")
message(STATUS "Welcome to Gear2D Creation Kit!")

# Get the external root path
get_filename_component(EXTERNAL_ROOT ${CMAKE_BINARY_DIR}/../external ABSOLUTE)
message(STATUS "Using ${EXTERNAL_ROOT} to place installed packages")

# Find Gear2D
message(STATUS "Looking for a Gear2D install")
find_package(Gear2D QUIET PATHS ${EXTERNAL_ROOT}/lib/gear2d/cmake)
if (Gear2D_FOUND)
  message(STATUS "Gear2D was found (version ${GEAR2D_VERSION})")
else()
  message(STATUS "No Gear2D was found. It will be built, then.")
  include(get-gear2d.cmake) # get-gear2d.cmake should deal with any dependencies.
endif()