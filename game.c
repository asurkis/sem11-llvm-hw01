#include "game.h"

static int calc_neighbors(const char* board, ssize_t width, ssize_t height, ssize_t row, ssize_t col) {
        int result = 0;
        for (ssize_t d_row = -1; d_row <= 1; ++d_row) {
                for (ssize_t d_col = -1; d_col <= 1; ++d_col) {
                        ssize_t rr = row + d_row;
                        ssize_t cc = col + d_col;
                        int fits_v = 0 <= rr && rr < height;
                        int fits_h = 0 <= cc && cc < width;
                        if (fits_v && fits_h) {
                                result += board[rr * width + cc];
                        }
                }
        }
        return result;
}

void fill_next_state(const char* board, char* board_next, ssize_t width, ssize_t height) {
        for (ssize_t row = 0; row < height; ++row) {
                for (ssize_t col = 0; col < width; ++col) {
                        int neighbors = calc_neighbors(board, width, height, row, col);
                        ssize_t idx = row * width + col;
                        if (board[idx]) {
                                // Self is also counted
                                int is3or4 = neighbors == 3 || neighbors == 4;
                                board_next[idx] = is3or4 ? 1 : 0;
                        } else {
                                board_next[idx] = neighbors == 3 ? 1 : 0;
                        }
                }
        }
}

void fill_pixels(const char* board,
                 ssize_t board_width,
                 ssize_t board_height,
                 unsigned char* pixels,
                 ssize_t surface_width,
                 ssize_t surface_height,
                 ssize_t bytes_per_pixel) {
        ssize_t row_stride = surface_height / board_height;
        ssize_t col_stride = surface_width / board_width;
        ssize_t row_offset = surface_height % board_height / 2;
        ssize_t col_offset = surface_width % board_width / 2;
        for (ssize_t row = 0; row < surface_height; ++row) {
                for (ssize_t col = 0; col < surface_width; ++col) {
                        ssize_t pixel_start = bytes_per_pixel * (row * surface_width + col);
                        if (row < row_offset || col < col_offset) {
                                for (ssize_t i = 0; i < bytes_per_pixel; ++i) {
                                        pixels[pixel_start + i] = 0x7F;
                                }
                                continue;
                        }
                        ssize_t brow = (row - row_offset) / row_stride;
                        ssize_t bcol = (col - col_offset) / col_stride;
                        if (brow >= board_height || bcol >= board_width) {
                                for (ssize_t i = 0; i < bytes_per_pixel; ++i) {
                                        pixels[pixel_start + i] = 0x7F;
                                }
                                continue;
                        }
                        ssize_t board_idx = brow * board_width + bcol;
                        char cell = board[board_idx];
                        for (ssize_t i = 0; i < bytes_per_pixel; ++i) {
                                pixels[pixel_start + i] = cell ? 0x00 : 0xFF;
                        }
                }
        }
}
