#ifndef GAME_H
#define GAME_H

#ifdef __cplusplus
#include <cstdint>
extern "C" {
#else
#include <stdint.h>
#endif

void fill_next_state(const char* board, char* board_next, int width, int height);

void fill_pixels(const char* board,
                 int board_width,
                 int board_height,
                 unsigned char* pixels,
                 int surface_width,
                 int surface_height,
                 int bytes_per_pixel);

#ifdef __cplusplus
}
#endif

#endif  // GAME_H
