# Adds a new-game target that is able to create a new game for you.
set(GAMES_FOLDER ${EXTERNAL_ROOT}/games CACHE PATH "Where your games are")

# Creates the new-game-helper executable
add_executable(new-game-helper src/new-game-helper.c)

add_custom_target(new-game
  COMMAND ${CMAKE_COMMAND} -P ${CMAKE_SOURCE_DIR}/cmake-scripts/generate-new-game.cmake
  DEPENDS new-game-helper
)