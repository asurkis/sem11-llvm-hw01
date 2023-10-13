#ifndef SIM_H
#define SIM_H

#include <stdbool.h>

#define SIM_X_SIZE 64
#define SIM_Y_SIZE 36

#ifdef __cplusplus
extern "C" {
#endif

extern void simBegin();
extern void simEnd();
extern bool simShouldContinue();

extern void simSetPixel(int x, int y, int rgb);
extern void simFlush();

#ifdef __cplusplus
}
#endif

#endif
