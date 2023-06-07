//
//  ForecastDetailViewControllerSpec.swift
//  Weather App UITests
//
//  Created by Shiv Vaishnav on 01/06/2023.
//


import Nimble
import Quick

@testable import Weather_App

final class ForecastDetailViewControllerSpec: QuickSpec {
    override class func spec() {
        var viewController: ForecastDetailViewController!

        beforeEach {
            viewController = ForecastDetailViewController.instantiate(storyboardName: "ForecastDetail", bundleClass: ForecastDetailViewControllerSpec.self)
            viewController.forecastDetailViewModel = ForecastDetailViewModel(forecast: MockDataProvider.mockForecastData().dailyForecasts!.first!, cityName: "Dhaka")
            let window = viewController.initializeWindow()
            window.makeKeyAndVisible()
        }

        describe("Forecast Detail screen") {
            beforeEach {
                let _ = viewController.view
                viewController.beginAppearanceTransition(true, animated: true)
                viewController.endAppearanceTransition()
            }

            it("should show 2 sections") {
                expect(viewController.tableView.numberOfSections).to(equal(2))
                expect(viewController.tableView.numberOfRows(inSection: 1)).to(equal(1))
            }
        }
    }
}
