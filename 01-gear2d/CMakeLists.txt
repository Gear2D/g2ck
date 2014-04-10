message(STATUS "Stage 1: Configuring commands")
#find_package(Gear2D QUIET)
add_custom_target(01-gear2d)
if (NOT Gear2D_FOUND)
  include(010-get-gear2d.cmake)
else()
  message(STATUS "Gear2D was found! Version ${GEAR2D_VERSION}")
endif()

# Depend on gear2d being existent
add_dependencies(01-gear2d gear2d gear2d-components)