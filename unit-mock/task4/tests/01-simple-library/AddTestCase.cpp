//
// Created by akhtyamovpavel on 5/1/20.
//

#include "AddTestCase.h"
#include "Functions.h"

TEST_F(AddTestCase, TwoPlusTwo) {
    ASSERT_EQ(5, Add(2, 3));
}