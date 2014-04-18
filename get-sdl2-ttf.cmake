include(ExternalProject)

if (WIN32)
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
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2-ttf/lib ${EXTERNAL_ROOT}/lib
      COMMAND ${CMAKE_COMMAND} -E copy_directory ${EXTERNAL_ROOT}/src/sdl2-ttf/include ${EXTERNAL_ROOT}/include/SDL2
  )
else()
  # Build sdl2-ttf
  ExternalProject_Add(
    freetype2
    PREFIX ${EXTERNAL_ROOT}
    URL http://download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.gz
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT}
  )
  
  ExternalProject_Add(
    sdl2-ttf
    DEPENDS freetype2
    PREFIX ${EXTERNAL_ROOT}
    DOWNLOAD_DIR ${DOWNLOAD_DIR}
    URL https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.12.tar.gz 
    CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=${EXTERNAL_ROOT} --with-freetype-prefix=${EXTERNAL_ROOT}
  )
endif()
