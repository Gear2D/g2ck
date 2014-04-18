include(ExternalProject)

set(DOWNLOAD_DIR "${EXTERNAL_ROOT}/downloads")

ExternalProject_Add(
  gear2d
  PREFIX ${EXTERNAL_ROOT}
  URL https://github.com/Gear2D/gear2d/archive/master.zip
  DOWNLOAD_NAME gear2d-master.zip
  DOWNLOAD_DIR ${DOWNLOAD_DIR}
  BINARY_DIR ${EXTERNAL_ROOT}/engine
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_ROOT}
)

# Check SDL before building Gear2D
set(ENV{SDL2DIR} ${EXTERNAL_ROOT})
find_package(SDL2 QUIET)
if (SDL2_FOUND)
  message(STATUS "SDL2 was found in ${SDL2_LIBRARY}")
  add_custom_target(sdl2)
else()
  message(STATUS "SDL2 could not be found. It will be built.")
  include(get-sdl2.cmake)
  add_dependencies(gear2d sdl2)               # Gear2D depends on 'sdl2'
endif()

# Also get the components
include(get-gear2d-components.cmake)
