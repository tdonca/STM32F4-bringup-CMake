#pragma once

#include<stdint.h>

class Calculator {
    public:
        int32_t add(int32_t a, int32_t b);
        int32_t subtract(int32_t a, int32_t b);
        int32_t multiply(int32_t a, int32_t b);
        int32_t divide(int32_t a, int32_t b);
};
