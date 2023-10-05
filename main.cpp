#include <SDL.h>

namespace {

SDL_Window *window = nullptr;
SDL_Surface *windowSurface = nullptr;
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

void main_loop_iteration() {
        process_events();
        SDL_GetWindowSurface(window);

        SDL_Rect rect;
        Uint32 color;

        SDL_LockSurface(windowSurface);
        const SDL_PixelFormat *format = windowSurface->format;
        int stride = format->BytesPerPixel;
        Uint8 *pixels = static_cast<Uint8 *>(windowSurface->pixels);
        int w = 0;
        int h = 0;
        SDL_GetWindowSize(window, &w, &h);
        for (int y = 0; y < h; ++y) {
                for (int x = 0; x < w; ++x) {
                        Uint8 *pCurPixel = &pixels[stride * (x + w * y)];
                        union {
                                Uint32 rgb = 0;
                                Uint8 data[4];
                        };
                        rgb |= (x & 0xFF) >> format->Rloss << format->Rshift;
                        rgb |= (y & 0xFF) >> format->Gloss << format->Gshift;

                        pCurPixel[0] = data[0];
                        pCurPixel[1] = data[1];
                        pCurPixel[2] = data[2];
                }
        }
        SDL_UnlockSurface(windowSurface);

        SDL_UpdateWindowSurface(window);
}

} // namespace

int main(int, char *[]) {
        SDL_Init(SDL_INIT_EVENTS | SDL_INIT_VIDEO);
        window = SDL_CreateWindow("Main window",
                                  SDL_WINDOWPOS_CENTERED,
                                  SDL_WINDOWPOS_CENTERED,
                                  800,
                                  600,
                                  SDL_WINDOW_RESIZABLE);
        windowSurface = SDL_GetWindowSurface(window);
        is_running = true;
        while (is_running) {
                main_loop_iteration();
        }
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 0;
}
