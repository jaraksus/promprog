//
// Created by Pavel Akhtyamov on 02.05.2020.
//

#include "WeatherTestCase.h"
#include "WeatherMock.h"

using ::testing::_;
using ::testing::Return;

void WeatherTestCase::SetUp() {
    weather.DelegateToFake();
}

TEST_F(WeatherTestCase, GetResponseForCity) {
    EXPECT_CALL(weather, Get("Moscow", _)).Times(1);
    weather.GetResponseForCity("Moscow", "url");
}

TEST_F(WeatherTestCase, GetResponseForCity_UnknownCity) {
    EXPECT_CALL(weather, Get("UnknownCity", _)).Times(1);
    try {
        weather.GetResponseForCity("UnknownCity", "url");
    } catch (std::invalid_argument const & err) {
        EXPECT_EQ(err.what(), std::string("Api error. City is bad"));
    } catch (...) {
        FAIL() << "Expected std::invalid_argument";
    }
}

TEST_F(WeatherTestCase, GetTemperature) {
    EXPECT_CALL(weather, Get("Moscow", weather.GetBaseUrl())).Times(1);
    EXPECT_CALL(weather, GetTemperature).WillOnce([this](const std::string& city) {
        return weather.Weather::GetTemperature(city);
    });
    float result = weather.GetTemperature("Moscow");
    EXPECT_NEAR(20.5, result, 1e-6);
}

TEST_F(WeatherTestCase, GetTomorrowTemperature) {
    EXPECT_CALL(weather, Get("Moscow", weather.GetForecastUrl())).Times(1);
    EXPECT_CALL(weather, GetTomorrowTemperature).WillOnce([this](const std::string& city) {
        return weather.Weather::GetTomorrowTemperature(city);
    });
    float result = weather.GetTomorrowTemperature("Moscow");
    EXPECT_NEAR(25.1, result, 1e-6);
}

TEST_F(WeatherTestCase, GetTomorrowDiff_MuchWarmer) {
    EXPECT_CALL(weather, GetTemperature).Times(1).WillOnce(Return(1.3));
    EXPECT_CALL(weather, GetTomorrowTemperature).Times(1).WillOnce(Return(5.5));
    std::string result = weather.GetTomorrowDiff("city");
    EXPECT_EQ(result, std::string("The weather in city tomorrow will be much warmer than today."));
}

TEST_F(WeatherTestCase, GetTomorrowDiff_MuchColder) {
    EXPECT_CALL(weather, GetTemperature).Times(1).WillOnce(Return(5.5));
    EXPECT_CALL(weather, GetTomorrowTemperature).Times(1).WillOnce(Return(1.3));
    std::string result = weather.GetTomorrowDiff("city");
    EXPECT_EQ(result, std::string("The weather in city tomorrow will be much colder than today."));
}

TEST_F(WeatherTestCase, GetTomorrowDiff_Warmer) {
    EXPECT_CALL(weather, GetTemperature).Times(1).WillOnce(Return(1.3));
    EXPECT_CALL(weather, GetTomorrowTemperature).Times(1).WillOnce(Return(2.1));
    std::string result = weather.GetTomorrowDiff("city");
    EXPECT_EQ(result, std::string("The weather in city tomorrow will be warmer than today."));
}

TEST_F(WeatherTestCase, GetTomorrowDiff_Colder) {
    EXPECT_CALL(weather, GetTemperature).Times(1).WillOnce(Return(2.1));
    EXPECT_CALL(weather, GetTomorrowTemperature).Times(1).WillOnce(Return(1.3));
    std::string result = weather.GetTomorrowDiff("city");
    EXPECT_EQ(result, std::string("The weather in city tomorrow will be colder than today."));
}

TEST_F(WeatherTestCase, GetTomorrowDiff_TheSame) {
    EXPECT_CALL(weather, GetTemperature).Times(1).WillOnce(Return(1.3));
    EXPECT_CALL(weather, GetTomorrowTemperature).Times(1).WillOnce(Return(1.4));
    std::string result = weather.GetTomorrowDiff("city");
    EXPECT_EQ(result, std::string("The weather in city tomorrow will be the same than today."));
}

TEST_F(WeatherTestCase, GetDifferenceString_FirstWarmer) {
    EXPECT_CALL(weather, GetTemperature)
            .Times(2)
            .WillOnce(Return(5.5))
            .WillOnce(Return(1.3));
    std::string result = weather.GetDifferenceString("c1", "c2");
    EXPECT_EQ(result, std::string("Weather in c1 is warmer than in c2 by 4 degrees"));
}

TEST_F(WeatherTestCase, GetDifferenceString_FirstColder) {
    EXPECT_CALL(weather, GetTemperature)
        .Times(2)
        .WillOnce(Return(1.3))
        .WillOnce(Return(5.5));
    std::string result = weather.GetDifferenceString("c1", "c2");
    EXPECT_EQ(result, std::string("Weather in c1 is colder than in c2 by 4 degrees"));
}

TEST_F(WeatherTestCase, SetApiKey) {
    std::string api_key = "api_key";
    weather.SetApiKey(api_key);
    ASSERT_EQ(api_key, weather.GetApiKey());
}