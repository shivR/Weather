//
//  ForecastViewSpec.swift
//  Weather App UITests
//
//  Created by Shiv Vaishnav on 31/05/2023.
//

import Nimble
import Quick

@testable import Weather_App

final class ForecastViewControllerSpec: QuickSpec {
    override class func spec() {
        var viewController: ForecastViewController!

        describe("Forecast screen") {
            beforeEach {
                viewController = ForecastViewController.instantiate(storyboardName: "Forecast", bundleClass: ForecastDetailViewControllerSpec.self)
                viewController.forecastViewModel = ForecastViewModel(worker: ForecastMockWorker(), city: MockDataProvider.mockTopCitiesData()[0])
                let window = UINavigationController(rootViewController: viewController).initializeWindow()
                window.makeKeyAndVisible()
            }

            context("Test number of forecast on screen") {
                beforeEach {
                    let _ = viewController.view
                }

                it("should be 5 only") {
                    expect(viewController.tableView.numberOfRows(inSection: 0))
                        .toEventually(equal(5), timeout: .seconds(5))
                }
            }

            context("Test on click of row") {
                beforeEach {
                    let _ = viewController.view
                    viewController.beginAppearanceTransition(true, animated: true)
                    viewController.endAppearanceTransition()
                    viewController.tableView(viewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
                }

                it("should show forecast detail screen") {
                    expect(viewController.navigationController?.topViewController).toEventually(beAnInstanceOf(ForecastDetailViewController.self))
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
