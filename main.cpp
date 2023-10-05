#include <SDL.h>

int main(int, char *[]) {
    SDL_Init(SDL_INIT_EVENTS | SDL_INIT_VIDEO);
    SDL_Window *window = SDL_CreateWindow("Main window", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 800, 600, 0);
    bool is_running = true;
    while (is_running) {
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
    SDL_DestroyWindow(window);
    return 0;
}
