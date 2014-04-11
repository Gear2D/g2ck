# Add SDL2 as external project
message(STATUS "SDL2 library will be built for you")

set(DOWNLOAD_DIR "${EXTERNAL_ROOT}/downloads")

# For win32 is better to download just the binaries.
if (WIN32)
  # Get SDL2 dev package
  ExternalProject_Add(
    sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL http://libsdl.org/release/SDL2-devel-2.0.3-mingw.tar.gz
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND 
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/lib ${EXTERNAL_ROOT}/lib
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/include ${EXTERNAL_ROOT}/include
  )
  
    # Get SDL2 Mixer dev package
  ExternalProject_Add(
    sdl2-mixer
    DEPENDS sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    https://libsdl.org/projects/SDL_mixer/release/SDL2_mixer-devel-2.0.0-VC.zip
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND 
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/lib ${EXTERNAL_ROOT}/lib
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/include ${EXTERNAL_ROOT}/include
  )
  
    # Get SDL2 Image dev package
  ExternalProject_Add(
    sdl2-image
    DEPENDS sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://libsdl.org/projects/SDL_image/release/SDL2_image-devel-2.0.0-VC.zip
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND 
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/lib ${EXTERNAL_ROOT}/lib
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/include ${EXTERNAL_ROOT}/include
  )
  
    # Get SDL2 TTF dev package
  ExternalProject_Add(
    sdl2-ttf
    DEPENDS sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://libsdl.org/projects/SDL_ttf/release/SDL2_ttf-devel-2.0.12-VC.zip
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND 
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/lib ${EXTERNAL_ROOT}/lib
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/include ${EXTERNAL_ROOT}/include
  )
else() # Now, if using anything else, get the sources. (TODO Poor MacOSX guys have nothing yet. :)

  # Build SDL2
  ExternalProject_Add(
    sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL http://libsdl.org/release/SDL2-2.0.3.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )
  
  # Build sdl2-mixer
  ExternalProject_Add(
    sdl2-mixer
    DEPENDS sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.0.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )
  
  # Build sdl2-image
  ExternalProject_Add(
    sdl2-image
    DEPENDS sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://libsdl.org/projects/SDL_image/release/SDL2_image-2.0.0.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )
  
  # Build sdl2-ttf
  ExternalProject_Add(
    sdl2-ttf
    DEPENDS sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.12.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )
  
endif()

# Make Gear2D depend on SDL2 being built first
add_dependencies(gear2d sdl2 sdl2-ttf sdl2-image sdl2-mixer)