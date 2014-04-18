include(ExternalProject)

if (WIN32)
  # Get SDL2 Mixer dev package
  ExternalProject_Add(
    sdl2-mixer
    DEPENDS sdl2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://libsdl.org/projects/SDL_mixer/release/SDL2_mixer-devel-2.0.0-VC.zip
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND 
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2-mixer/lib ${EXTERNAL_ROOT}/lib
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2-mixer/include ${EXTERNAL_ROOT}/include/SDL2
  )
else()
  # Yay, we need mixer friends.

  ExternalProject_Add(
    tremor
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    SVN_REPOSITORY http://svn.xiph.org/trunk/Tremor/
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )  
  
  ExternalProject_Add(
    flac
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL http://downloads.xiph.org/releases/flac/flac-1.2.1.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT} --disable-xmms-plugin --disable-oggtest --disable-doxygen-docs --disable-rpath
    BUILD_IN_SOURCE 1 # FLAC wants its api/ folder :(
    PATCH_COMMAND patch -Np1 < ${CMAKE_SOURCE_DIR}/patches/flac-1.2.1.patch
    DEPENDS tremor
  )
  
  ExternalProject_Add(
    smpeg
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    SVN_REPOSITORY svn://svn.icculus.org/smpeg/trunk
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )  

  
  # Build sdl2-mixer
  ExternalProject_Add(
    sdl2-mixer
    DEPENDS sdl2 flac smpeg tremor
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://libsdl.org/projects/SDL_mixer/release/SDL2_mixer-2.0.0.tar.gz
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )
  
endif()