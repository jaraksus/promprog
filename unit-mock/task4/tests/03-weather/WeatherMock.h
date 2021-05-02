//
// Created by Pavel Akhtyamov on 02.05.2020.
//

#pragma once

#include <gmock/gmock.h>
#include <Weather.h>

#include "cpr/cpr.h"

class FakeWeather : public Weather {
public:
    cpr::Response Get(const std::string& city, const cpr::Url& url) override;
};

class WeatherMock : public Weather {
public:
    MOCK_METHOD(cpr::Response, Get, (const std::string& city, const cpr::Url& url), (override));
    MOCK_METHOD(float, GetTemperature, (const std::string& city), (override));
    MOCK_METHOD(float, GetTomorrowTemperature, (const std::string& city), (override));

    void DelegateToFake();

    cpr::Url GetBaseUrl();
    cpr::Url GetForecastUrl();
    std::string GetApiKey();
private:
    FakeWeather fake_;
};



