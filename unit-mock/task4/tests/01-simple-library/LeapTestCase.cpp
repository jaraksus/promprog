//
// Created by akhtyamovpavel on 5/1/20.
//

#include "LeapTestCase.h"

#include <Functions.h>

TEST_F(LeapTestCase, MultipleOf400) {
    ASSERT_EQ(true, IsLeap(800));
    ASSERT_EQ(true, IsLeap(2000));
}

TEST_F(LeapTestCase, MultipleOf100ButNotOf400) {
    ASSERT_EQ(false, IsLeap(100));
    ASSERT_EQ(false, IsLeap(500));
    ASSERT_EQ(false, IsLeap(2100));
}

TEST_F(LeapTestCase, MultipleOf4ButNotOf100) {
    ASSERT_EQ(true, IsLeap(8));
    ASSERT_EQ(true, IsLeap(2020));
}

TEST_F(LeapTestCase, NotMultipleOf4) {
    ASSERT_EQ(false, IsLeap(2021));
}

TEST_F(LeapTestCase, IncorrectArgument) {
    try {
        IsLeap(-20);
    }
    catch (std::invalid_argument const & err) {
        // ok
    }
    catch (...) {
        FAIL() << "Expected std::invalid_argument";
    }
}

TEST(GetMonthDays, June2021) {
    ASSERT_EQ(30, GetMonthDays(2021, 6));
}

TEST(GetMonthDays, July2021) {
    ASSERT_EQ(31, GetMonthDays(2021, 7));
}

TEST(GetMonthDays, February2021) {
    ASSERT_EQ(28, GetMonthDays(2021, 2));
}

TEST(GetMonthDays, FebruaryLeapYear) {
    ASSERT_EQ(29, GetMonthDays(2020, 2));
}

TEST(GetMonthDays, InvalidArgument) {
    try {
        GetMonthDays(2020, -5);
    }
    catch (std::invalid_argument const & err) {
        // ok
    }
    catch (...) {
        FAIL() << "Expected std::invalid_argument";
    }
}