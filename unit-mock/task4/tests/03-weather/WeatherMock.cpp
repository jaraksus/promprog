//
// Created by Pavel Akhtyamov on 02.05.2020.
//

#include "WeatherMock.h"

cpr::Response FakeWeather::Get(const std::string& city, const cpr::Url& url) {
    cpr::Response response;
    response.status_code = 200;
    if (city == "Moscow") {
        response.text = R"(
        {
            "main": {
                "temp": 20.5
            },
            "list": [
                {}, {}, {}, {}, {}, {}, {},
                {
                    "main": {
                        "temp": 25.1
                    }
                }
            ]
        }
        )";
    } else {
        response.status_code = 404;
    }

    return response;
}

void WeatherMock::DelegateToFake() {
    ON_CALL(*this, Get).WillByDefault([this](const std::string& city, const cpr::Url& url) {
        return fake_.Get(city, url);
    });
}

cpr::Url WeatherMock::GetBaseUrl() {
    return kBaseUrl;
}

cpr::Url WeatherMock::GetForecastUrl() {
    return kForecastUrl;
}

std::string WeatherMock::GetApiKey() {
    return api_key_;
}