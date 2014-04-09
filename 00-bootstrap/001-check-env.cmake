# This script can check the building environment
# It should not be called by itself, but rather included in CMakeLists.txt
try_run(CHECK_ENV_RUN CHECK_ENV_COMPILE ${CMAKE_CURRENT_BINARY_DIR} 001-check-env.cc COMPILE_DEFINITIONS "-std=c++11")