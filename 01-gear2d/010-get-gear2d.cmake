include(ExternalProject)

get_filename_component(EXTERNAL_ROOT ${CMAKE_BINARY_DIR}/../external ABSOLUTE)
message(STATUS "${EXTERNAL_ROOT} folder will be used as home for external dependencies.")
message(STATUS "Gear2D and its components will be built for you.")
ExternalProject_Add(
  gear2d
  PREFIX ${EXTERNAL_ROOT}
  URL https://github.com/Gear2D/gear2d/archive/master.zip
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_ROOT}
)

ExternalProject_Add(
  gear2d-components
  PREFIX ${EXTERNAL_ROOT}
  URL https://github.com/Gear2D/gear2d-components/archive/master.zip
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_ROOT}
)

# Make gear2d-components depend on gear2d
add_dependencies(gear2d-components gear2d)
