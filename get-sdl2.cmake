include(ExternalProject)

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
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/include ${EXTERNAL_ROOT}/include/SDL2
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
endif()