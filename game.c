#include "game.h"

static int calc_neighbors(const char *board, int width, int height, int row, int col) {
        int result = 0;
        for (int d_row = -1; d_row <= 1; ++d_row) {
                for (int d_col = -1; d_col <= 1; ++d_col) {
                        int rr = row + d_row;
                        int cc = col + d_col;
                        int fits_v = 0 <= rr && rr < height;
                        int fits_h = 0 <= cc && cc < width;
                        if (fits_v && fits_h) {
                                result += board[rr * width + cc];
                        }
                }
        }
        return result;
}

void fill_next_state(const char *board, char *board_next, int width, int height) {
        for (int row = 0; row < height; ++row) {
                for (int col = 0; col < width; ++col) {
                        int neighbors = calc_neighbors(board, width, height, row, col);
                        int idx = row * width + col;
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

void fill_pixels(const char *board,
                 int board_width,
                 int board_height,
                 unsigned char *pixels,
                 int surface_width,
                 int surface_height,
                 int bytes_per_pixel) {
        int row_stride = surface_height / board_height;
        int col_stride = surface_width / board_width;
        int cell_size = row_stride < col_stride ? row_stride : col_stride;
        int row_offset = (surface_height - cell_size * board_height) / 2;
        int col_offset = (surface_width - cell_size * board_width) / 2;

        for (int row = 0; row < surface_height; ++row) {
                for (int col = 0; col < surface_width; ++col) {
                        int pixel_start = bytes_per_pixel * (row * surface_width + col);
                        if (row < row_offset || col < col_offset) {
                                for (int i = 0; i < bytes_per_pixel; ++i) {
                                        pixels[pixel_start + i] = 0x7F;
                                }
                                continue;
                        }
                        int brow = (row - row_offset) / cell_size;
                        int bcol = (col - col_offset) / cell_size;
                        if (brow >= board_height || bcol >= board_width) {
                                for (int i = 0; i < bytes_per_pixel; ++i) {
                                        pixels[pixel_start + i] = 0x7F;
                                }
                                continue;
                        }
                        int board_idx = brow * board_width + bcol;
                        char cell = board[board_idx];
                        for (int i = 0; i < bytes_per_pixel; ++i) {
                                pixels[pixel_start + i] = cell ? 0x00 : 0xFF;
                        }
                }
        }
}
