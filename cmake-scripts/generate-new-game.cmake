execute_process(COMMAND ${CMAKE_BINARY_DIR}/new-game-helper OUTPUT_VARIABLE GAME_NAME)
message(STATUS "New game ${GAME_NAME}")