//
//  ForecastViewModelTests.swift
//  Weather AppTests
//
//  Created by Shiv Vaishnav on 02/04/2023.
//

import Nimble
import Quick

@testable import Weather_App

final class ForecastViewModelSpec: QuickSpec {
    override class func spec() {
        var viewModel: ForecastViewModel?

        describe("Forecast ViewModel testing") {
            context("Testing forecasts") {
                beforeEach {
                    let city = MockDataProvider.mockTopCitiesData()[0]
                    viewModel = ForecastViewModel(worker: ForecastMockWorker(), city: city)
                    viewModel?.getForecast()
                }

                it("forecasts should be of 5 days") {
                    expect(viewModel?.numberOfRows)
                        .toEventually(
                            equal(5),
                            timeout: .seconds(5)
                        )
                }

                it("forecasts should be of Dhaka city") {
                    expect(viewModel?.cityName).to(equal("Dhaka"))
                }

                it("forecast summary should be same expecting from forecast protocol provider") {
                    expect(viewModel?.itemAtIndex(index: 0)?.dayValue).to(equal("Sat"))
                    expect(viewModel?.itemAtIndex(index: 0)?.dateValue).to(equal("04/01"))
                    expect(viewModel?.itemAtIndex(index: 0)?.maxTemp).to(equal("31°"))
                    expect(viewModel?.itemAtIndex(index: 0)?.minTemp).to(equal("/18°"))
                    expect(viewModel?.itemAtIndex(index: 0)?.summary).to(equal("Couple of thunderstorms"))
                    expect(viewModel?.itemAtIndex(index: 0)?.icon).to(equal(17))
                    expect(viewModel?.itemAtIndex(index: 0)?.precipitationType).to(equal("Rain"))
                    expect(viewModel?.itemAtIndex(index: 0)?.precipitationProbability).to(equal(79))
                    expect(viewModel?.itemAtIndex(index: 0)?.cloudCover).to(equal(70))
                    expect(viewModel?.itemAtIndex(index: 0)?.realFeel).to(equal(34))
                    expect(viewModel?.itemAtIndex(index: 0)?.realFeelShade).to(equal(30))
                    expect(viewModel?.itemAtIndex(index: 0)?.windSpeed).to(equal("5 mi/h"))
                    expect(viewModel?.itemAtIndex(index: 0)?.windGustsSpeed).to(equal("18 mi/h"))
                }
            }
        }

        describe("Forecast ViewModel Worker Testing") {
            context("Testing forecasts from Worker") {
                beforeEach {
                    let city = MockDataProvider.mockTopCitiesData()[0]
                    viewModel = ForecastViewModel(
                        worker: ForecastWorker(APINetworkMockClient()),
                        city: city
                    )
                    viewModel?.getForecast()
                }

                it("forecasts should be of 5 days") {
                    expect(viewModel?.numberOfRows)
                        .toEventually(equal(5), timeout: .seconds(5))
                }
            }
        }
    }
}

final class ForecastMockWorker: ForecastWorkerLogic {
    func getForecast(cityId: String, onCompletion: @escaping (ForecastResult) -> Void) {
        onCompletion(.success(MockDataProvider.mockForecastData()))
    }
}

final class APINetworkMockClient: APINetworkClientProtocol {
    func startService<T>(
        _ service: BaseService,
        completion: @escaping (Result<T, Error>) -> Void)
    where T : Decodable, T : Encodable {
        completion(.success(MockDataProvider.mockForecastData() as! T))
    }
}
