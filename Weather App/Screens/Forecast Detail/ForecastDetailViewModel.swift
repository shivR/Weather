//
//  ForecastDetailViewModel.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 02/04/2023.
//

import Foundation

protocol ForecastDetailViewModelLogic {
    var forecast: DailyForecasts { get }
    var cityName: String? { get }
}

final class ForecastDetailViewModel: ForecastDetailViewModelLogic {
    var forecast: DailyForecasts
    var cityName: String?

    init(forecast: DailyForecasts, cityName: String?) {
        self.forecast = forecast
        self.cityName = cityName
    }
}
