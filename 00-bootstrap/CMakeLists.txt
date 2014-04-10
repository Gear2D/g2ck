# This creates all the bootstrap targets

message(STATUS "Stage 0: Now (possibly) checking your environment")

# Bootstrap target meta target will check if you can compile stuff.
include(001-check-env.cmake)
message(STATUS "Stage 0: Bootstrap checks finished.")
  