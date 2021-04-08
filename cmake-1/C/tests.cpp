#include "A/index.h"
#include "B/lib.h"

#include <gtest/gtest.h>

TEST(INDEX, getId) {
    int id = getId('b');
    ASSERT_EQ(id, 1);
}

TEST(LIB_ARITHMETIC, mod_sum) {
    int a = 1000000000;
    int b = 10;
    ASSERT_EQ(mod_sum(a, b), 3);
}

TEST(LIB_ARITHMETIC, mod_mul) {
    int a = 1000000000;
    int b = 10;
    ASSERT_EQ(mod_mul(a, b), 999999937);
}