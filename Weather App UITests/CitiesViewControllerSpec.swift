//
//  CitiesViewControllerSpec.swift
//  Weather App UITests
//
//  Created by Shiv Vaishnav on 01/06/2023.
//

import Nimble
import Quick

final class CitiesViewControllerSpec: QuickSpec {
    override class func spec() {
        var rootNavVC: UINavigationController!

        describe("CitiesViewController Tests") {
            beforeEach {
                rootNavVC = CitiesViewController.instantiate(storyboardName: "Cities", vcIdentifier: "CitiesNavigationViewController", bundleClass: CitiesViewControllerSpec.self)
                let window = rootNavVC.initializeWindow()
                window.makeKeyAndVisible()
            }

            context("Test first screen instance") {
                it("should be a CitiesViewController instance only") {
                    // Assert:
                    expect(rootNavVC.viewControllers.first).to(beAnInstanceOf(CitiesViewController.classForCoder()))
                }
            }

            context("Test number of cells") {
                beforeEach {
                    let citiesVC = rootNavVC.topViewController as! CitiesViewController
                    citiesVC.citiesViewModel = CitiesViewModel(worker: CitiesMockWorker())

                    _ = citiesVC.view
                    citiesVC.beginAppearanceTransition(true, animated: true)
                    citiesVC.endAppearanceTransition()
                }

                it("should be 50 on the screen") {
                    let citiesVC = rootNavVC.topViewController as! CitiesViewController
                    expect(citiesVC.tableView.numberOfRows(inSection: 0))
                        .toEventually(equal(50), timeout: .seconds(5))
                }
            }

            context("Test clicking on a row") {
                beforeEach {
                    let citiesVC = rootNavVC.topViewController as! CitiesViewController
                    citiesVC.citiesViewModel = CitiesViewModel(worker: CitiesMockWorker())

                    _ = citiesVC.view
                    citiesVC.beginAppearanceTransition(true, animated: true)
                    citiesVC.endAppearanceTransition()
                    citiesVC.tableView(citiesVC.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
                }

                it("should show forecast screen") {
                    expect(rootNavVC.topViewController).toEventually(beAnInstanceOf(ForecastViewController.self))
                }
            }

            context("Test throwing error") {
                beforeEach {
                    let citiesVC = rootNavVC.topViewController as! CitiesViewController
                    let viewModel = CitiesViewModel(worker: CitiesWorker())
                    citiesVC.citiesViewModel = viewModel

                    _ = citiesVC.view
                    citiesVC.beginAppearanceTransition(true, animated: true)
                    citiesVC.endAppearanceTransition()

                    viewModel.showError("error")
                }

                it("should present a UIAlertController") {
                    expect(rootNavVC.topViewController?.presentedViewController).toEventually(beAnInstanceOf(UIAlertController.self))
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
