//
//  Weather_AppTests.swift
//  Weather AppTests
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

import Nimble
import Quick

@testable import Weather_App

final class CitiesViewModelSpec: QuickSpec {
    override class func spec() {
        var viewModel: CitiesViewModel?

        describe("Cities ViewModel testing") {
            beforeEach {
                viewModel = CitiesViewModel(worker: CitiesMockWorker())
                viewModel?.fetchCities()
            }
            context("Test number of cities") {
                it("cities count should be 50") {
                    expect(viewModel?.numberOfRows)
                        .toEventually(
                            equal(50),
                            timeout: .seconds(5)
                        )
                }
            }
        }
    }
}

final class CitiesMockWorker: CitiesWorkerLogic {
    func getTopCities(onCompletion: @escaping (CitiesResult) -> Void) {
        onCompletion(.success(MockDataProvider.mockTopCitiesData()))
    }
}
