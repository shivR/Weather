//
//  ForecastDetailViewModelTests.swift
//  Weather App Tests
//
//  Created by Shiv Vaishnav on 01/06/2023.
//

import Nimble
import Quick

@testable import Weather_App

final class ForecastDetailViewModelSpec: QuickSpec {
    override class func spec() {
        var viewModel: ForecastDetailViewModelLogic?

        describe("Forecast Detail ViewModel testing") {
            context("Testing Forecast Summary") {
                beforeEach {
                    let city = MockDataProvider.mockTopCitiesData()[0]
                    let forecastViewModel = ForecastViewModel(worker: ForecastMockWorker(), city: city)
                    forecastViewModel.getForecast()
                    viewModel = ForecastDetailViewModel(forecast: forecastViewModel.itemAtIndex(index: 0)!, cityName: city.name)
                }

                it("first forecase summary should be Couple of thunderstorms") {
                    expect(viewModel?.forecast.summary).to(equal("Couple of thunderstorms"))
                }
            }
        }
    }
}
