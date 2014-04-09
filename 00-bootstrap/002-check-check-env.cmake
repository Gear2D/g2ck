# Check if 001-check-env.cmake was successful.
if(EXISTS ${CMAKE_CURRENT_BINARY_DIR}/001-check-env${CMAKE_EXECUTABLE_SUFFIX})
  set(BOOTSTRAP_ENV_OK true)
else()
  set(BOOTSTRAP_ENV_OK false)
endif()

if (BOOTSTRAP_ENV_OK)
  message(STATUS "Stage 0: Compile environment is ok :D")
endif()