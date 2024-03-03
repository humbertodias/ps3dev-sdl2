#include <stdio.h>
#include <stdlib.h>
#include <SDL.h>

int main() {
    // Initialize SDL
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "Unable to initialize SDL: %s\n", SDL_GetError());
        return 1;
    }

    // Create a window
    SDL_Window *window = SDL_CreateWindow("Hello World", 
                                          SDL_WINDOWPOS_UNDEFINED, 
                                          SDL_WINDOWPOS_UNDEFINED, 
                                          640, 
                                          480, 
                                          SDL_WINDOW_SHOWN);
    if (window == NULL) {
        fprintf(stderr, "Unable to create window: %s\n", SDL_GetError());
        SDL_Quit();
        return 1;
    }

    // Create a renderer
    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
    if (renderer == NULL) {
        fprintf(stderr, "Unable to create renderer: %s\n", SDL_GetError());
        SDL_DestroyWindow(window);
        SDL_Quit();
        return 1;
    }

    // Set renderer draw color to white
    SDL_SetRenderDrawColor(renderer, 255, 255, 255, 255);

    // Clear the screen
    SDL_RenderClear(renderer);

    // Present the renderer
    SDL_RenderPresent(renderer);

    // Wait for a few seconds
    SDL_Delay(3000);

    // Cleanup
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return 0;
}
