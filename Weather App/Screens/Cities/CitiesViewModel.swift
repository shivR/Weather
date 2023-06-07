//
//  CitiesViewModel.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

protocol CitiesViewModelLogic: BaseViewModel, AnyObject {
    var numberOfRows: Int { get }
    func itemAtIndex(index: Int) -> CityModel?
    func fetchCities()
}

class CitiesViewModel {
    var showIndicator: (Bool) -> Void = { _ in }
    var showError: (String) -> Void = { _ in }
    var reloadView: () -> Void = { }

    private let worker: CitiesWorkerLogic
    private var cities: [CityModel] = [] {
        didSet {
            reloadView()
        }
    }

    init(worker: CitiesWorkerLogic) {
        self.worker = worker
    }
}

extension CitiesViewModel: CitiesViewModelLogic {
    var numberOfRows: Int {
        cities.count
    }

    func itemAtIndex(index: Int) -> CityModel? {
        return cities[safe: index]
    }

    func fetchCities() {
        showIndicator(true)

        worker.getTopCities {[weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let cities):
                self.cities = cities
            case .failure(let error):
                self.showError(error.localizedDescription)
            }
            self.showIndicator(false)
        }
    }
}
