include(ExternalProject)

set(DOWNLOAD_DIR "${EXTERNAL_ROOT}/downloads")

ExternalProject_Add(
  gear2d-components
  DEPENDS gear2d
  PREFIX ${EXTERNAL_ROOT}
  URL https://github.com/Gear2D/gear2d-components/archive/master.zip
  DOWNLOAD_NAME gear2d-components-master.zip
  DOWNLOAD_DIR ${DOWNLOAD_DIR}
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${EXTERNAL_ROOT} -DCMAKE_PREFIX_PATH=${EXTERNAL_ROOT}
)

# Welp, we need SDL2 built.
set(ENV{SDL2DIR} ${EXTERNAL_ROOT})

if (NOT TARGET sdl2)
  find_package(SDL2 QUIET)
  if (SDL2_FOUND)
    message(STATUS "SDL2 was found in ${SDL2_LIBRARY}")
    add_custom_target(sdl2)
  else()
    message(STATUS "SDL2 could not be found. It will be built.")
    include(get-sdl2.cmake)                     # Shall define the 'sdl2' target
    add_dependencies(gear2d-components sdl2)    # Gear2D-Components also depends on 'sdl2'
  endif(SDL2_FOUND)
endif(NOT TARGET sdl2)

# Now include the other sdl stuff if needed.
find_package(SDL2_image QUIET)
if (SDL2_IMAGE_FOUND)
  add_custom_target(sdl2-image)
  message(STATUS "SDL2_image was found at ${SDL2_IMAGE_LIBRARY}")
else()
  message(STATUS "SDL2_image could not be found. It will be built.")
  include(get-sdl2-image.cmake)                   # Shall define the 'sdl2-image' target
  add_dependencies(gear2d-components sdl2-image)  # Gear2D-Components depends on sdl2-image
endif()

find_package(SDL2_mixer QUIET)
if (SDL2_MIXER_FOUND)
  add_custom_target(sdl2-mixer)
  message(STATUS "SDL2_mixer was found at ${SDL2_MIXER_LIBRARY}")
else()
  message(STATUS "SDL2_mixer could not be found. It will be built.")
  include(get-sdl2-mixer.cmake)                   # Shall define the 'sdl2-mixer' target
  add_dependencies(gear2d-components sdl2-mixer)  # Gear2D-Components depends on sdl2-mixer
endif()

find_package(SDL2_ttf QUIET)
if (SDL2_TTF_FOUND)
  add_custom_target(sdl2-ttf)
  message("SDL2_ttf was found at ${SDL2_TTF_LIBRARY}")
else()
  message(STATUS "SDL2_ttf could not be found. It will be built.")
  include(get-sdl2-ttf.cmake)                     # Shall define the 'sdl2-ttf' target
  add_dependencies(gear2d-components sdl2-ttf)    # Gear2D-Components depends on sdl2-ttf
endif()
