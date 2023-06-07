//
//  MockDataProvider.swift
//  Weather AppTests
//
//  Created by Shiv V on 1/06/23.
//

import Foundation
@testable import Weather_App

class MockDataProvider {
    static func mockTopCitiesData() -> [CityModel] {
        guard let pathString = Bundle(for: self).url(forResource: "TopCities", withExtension: "json") else {
            fatalError("TopCities.json not found")
        }

        guard let jsonData = try? Data(contentsOf: pathString) else {
            fatalError("Unable to convert TopCities.json to Data")
        }
        
        guard let citiesModel = try? JSONDecoder().decode([CityModel].self, from: jsonData) else {
            fatalError("Unable to convert TopCities.json to [CityModel] model")
        }
        
        return citiesModel
    }

    static func mockForecastData() -> ForecastModel {
        guard let pathString = Bundle(for: self).url(forResource: "forecast", withExtension: "json") else {
            fatalError("forecast.json not found")
        }

        guard let jsonData = try? Data(contentsOf: pathString) else {
            fatalError("Unable to convert forecast.json to Data")
        }

        guard let forecastModel = try? JSONDecoder().decode(ForecastModel.self, from: jsonData) else {
            fatalError("Unable to convert forecast.json to ForecastModel model")
        }

        return forecastModel
    }

}
