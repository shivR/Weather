//
//  RestAPISpec.swift
//  Weather App Tests
//
//  Created by Shiv Vaishnav on 01/06/2023.
//

import Nimble
import Quick

@testable import Weather_App

final class RestAPISpec: QuickSpec {
    override class func spec() {
        var cities: [CityModel]?
        var cityWorker: CitiesWorker?

        var forecastWorker: ForecastWorker?
        var forecast: ForecastModel?

        describe("Cities API Testing") {
            context("Testing cities count") {
                beforeEach {
                    cityWorker = CitiesWorker()
                    cityWorker?.getTopCities { result in
                        switch result {
                        case .success(let cityModel):
                            cities = cityModel
                        case .failure:
                            break
                        }
                    }
                }
                it("cities should be 50") {
                    expect(cities?.count).toEventually(equal(50), timeout: .seconds(10))
                }
            }
        }

        describe("Forecast API Testing") {
            context("Testing forecast api") {
                beforeEach {
                    forecastWorker = ForecastWorker()
                    forecastWorker?.getForecast(cityId: (cities?.first?.cityId)!, onCompletion: { result in
                        switch result {
                        case .success(let forecas):
                            forecast = forecas
                        case .failure:
                            break
                        }
                    })
                }
                it("forecasts should not be nil") {
                    expect(forecast).toNotEventually(beNil(), timeout: .seconds(10))
                }
            }
        }
    }
}
