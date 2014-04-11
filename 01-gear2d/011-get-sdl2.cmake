# Add SDL2 as external project
message(STATUS "SDL2 library will be built for you")

# For win32 is better to download just the binaries.
if (WIN32)
  ExternalProject_Add(
    sdl2
    PREFIX ${EXTERNAL_ROOT}
    URL http://libsdl.org/release/SDL2-devel-2.0.3-mingw.tar.gz
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND 
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/lib ${EXTERNAL_ROOT}/lib
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2/include ${EXTERNAL_ROOT}/include
  )
else() # Now, if using anything else, get the sources. (TODO Poor MacOSX guys have nothing yet. :)
  ExternalProject_Add(
    sdl2
    PREFIX ${EXTERNAL_ROOT}
    URL http://libsdl.org/release/SDL2-2.0.3.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )
endif()

# Make Gear2D depend on SDL2 being built first
add_dependencies(gear2d sdl2)