include(ExternalProject)

get_filename_component(EXTERNAL_ROOT ${CMAKE_BINARY_DIR}/../external ABSOLUTE)
message(STATUS "${EXTERNAL_ROOT} folder will be used as home for external dependencies.")
message(STATUS "Gear2D and its components will be built for you.")
ExternalProject_Add(
  gear2d
  PREFIX ${EXTERNAL_ROOT}
  URL https://github.com/Gear2D/gear2d/archive/master.zip
  DOWNLOAD_NAME gear2d-master.zip
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_ROOT} -DSDL2DIR=${EXTERNAL_ROOT}
)

ExternalProject_Add(
  gear2d-components
  PREFIX ${EXTERNAL_ROOT}
  URL https://github.com/Gear2D/gear2d-components/archive/master.zip
  DOWNLOAD_NAME gear2d-components-master.zip
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_ROOT} -DSDL2DIR=${EXTERNAL_ROOT}
)

# Check SDL before building Gear2D
find_package(SDL2 QUIET)
if (SDL2_FOUND)
	message(STATUS "SDL2 was found! Version ${SDL2_VERSION}")
else()
	include(011-get-sdl2.cmake)
endif()


# Make gear2d-components depend on gear2d
add_dependencies(gear2d-components gear2d)
