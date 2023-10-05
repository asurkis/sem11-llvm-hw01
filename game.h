#ifndef GAME_H
#define GAME_H

#ifdef __cplusplus
#include <cstdint>
extern "C" {
#else
#include <stdint.h>
#endif

void fill_next_state(const char* board, char* board_next, ssize_t width, ssize_t height);

void fill_pixels(const char* board,
                 ssize_t board_width,
                 ssize_t board_height,
                 unsigned char* pixels,
                 ssize_t surface_width,
                 ssize_t surface_height,
                 ssize_t bytes_per_pixel);

#ifdef __cplusplus
}
#endif

#endif  // GAME_H
