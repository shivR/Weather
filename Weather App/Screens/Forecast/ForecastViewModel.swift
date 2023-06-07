//
//  ForecastViewModel.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

protocol ForecastViewModelLogic: BaseViewModel {
    var cityName: String? { get }
    var numberOfRows: Int { get }
    func itemAtIndex(index: Int) -> DailyForecasts?
    func getForecast()
}

class ForecastViewModel {
    var showIndicator: (Bool) -> Void = { _ in }
    var showError: (String) -> Void = { _ in }
    var reloadView: () -> Void = { }

    private var forecast: ForecastModel? {
        didSet {
            reloadView()
        }
    }

    private var city: CityModel
    private let worker: ForecastWorkerLogic

    init(worker: ForecastWorkerLogic, city: CityModel) {
        self.worker = worker
        self.city = city
    }
}

extension ForecastViewModel: ForecastViewModelLogic {
    var numberOfRows: Int {
        forecast?.dailyForecasts?.count ?? 0
    }

    func itemAtIndex(index: Int) -> DailyForecasts? {
        forecast?.dailyForecasts?[safe: index]
    }

    var cityName: String? {
        return city.name
    }

    func getForecast() {
        showIndicator(true)
        guard let cityId = city.cityId else { return }
        worker.getForecast(cityId: cityId) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                self.forecast = model
            case .failure(let error):
                self.showError(error.localizedDescription)
            }
            showIndicator(false)
        }
    }
}
