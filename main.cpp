#include "game.h"
#include <SDL.h>
#include <vector>

namespace {

constexpr int BOARD_WIDTH = 64;
constexpr int BOARD_HEIGHT = 36;
constexpr int BOARD_SIZE = BOARD_WIDTH * BOARD_HEIGHT;
// vector<bool> does not provide actual array
std::vector<char> board(BOARD_SIZE, 0);
std::vector<char> board_next(BOARD_SIZE, 0);

void init_board() {
        // Add a glider
        board[1] = 1;
        board[2 + BOARD_WIDTH] = 1;
        board[0 + 2 * BOARD_WIDTH] = 1;
        board[1 + 2 * BOARD_WIDTH] = 1;
        board[2 + 2 * BOARD_WIDTH] = 1;
}

SDL_Window *window = nullptr;
bool is_running = true;

void process_events() {
        SDL_Event event;
        while (SDL_PollEvent(&event)) {
                switch (event.type) {
                case SDL_QUIT:
                        is_running = false;
                        break;
                case SDL_KEYDOWN:
                        switch (event.key.keysym.scancode) {
                        case SDL_SCANCODE_ESCAPE:
                                is_running = false;
                                break;
                        default:
                                break;
                        }
                default:
                        break;
                }
        }
}

Uint32 last_tick = 0;

void main_loop_iteration() {
        process_events();
        SDL_GetWindowSurface(window);

        Uint32 tick = SDL_GetTicks();
        if (tick < last_tick + 125) {
                return;
        }
        last_tick = tick;

        fill_next_state(board.data(), board_next.data(), BOARD_WIDTH, BOARD_HEIGHT);
        board.swap(board_next);

        SDL_Surface *window_surface = SDL_GetWindowSurface(window);
        SDL_LockSurface(window_surface);
        const SDL_PixelFormat *format = window_surface->format;
        int stride = format->BytesPerPixel;
        auto pixels = static_cast<unsigned char *>(window_surface->pixels);
        int w = 0;
        int h = 0;
        SDL_GetWindowSize(window, &w, &h);
        fill_pixels(board.data(), BOARD_WIDTH, BOARD_HEIGHT, pixels, w, h, stride);
        SDL_UnlockSurface(window_surface);

        SDL_UpdateWindowSurface(window);
}

} // namespace

int main(int, char *[]) {
        SDL_Init(SDL_INIT_EVENTS | SDL_INIT_VIDEO);
        window = SDL_CreateWindow("Main window",
                                  SDL_WINDOWPOS_CENTERED,
                                  SDL_WINDOWPOS_CENTERED,
                                  1280,
                                  720,
                                  SDL_WINDOW_RESIZABLE | SDL_WINDOW_ALLOW_HIGHDPI);

        init_board();

        is_running = true;
        while (is_running) {
                main_loop_iteration();
        }
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 0;
}
