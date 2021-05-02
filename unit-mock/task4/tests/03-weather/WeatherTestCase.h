
#pragma once

#include <gtest/gtest.h>

#include "WeatherMock.h"

class WeatherTestCase : public ::testing::Test {
public:
    void SetUp() override;
    WeatherMock weather;
};



