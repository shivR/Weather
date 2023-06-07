//
//  ForecastWorker.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

typealias ForecastResult = Result<ForecastModel, Error>

protocol ForecastWorkerLogic {
    func getForecast(cityId: String, onCompletion: @escaping (ForecastResult) -> Void)
}

final class ForecastWorker: ForecastWorkerLogic {
    private var networkClient: APINetworkClientProtocol

    init(_ networkClient: APINetworkClientProtocol = APINetworkClient()) {
        self.networkClient = networkClient
    }

    func getForecast(cityId: String, onCompletion: @escaping (ForecastResult) -> Void) {
        let service = ForecastService(locationKey: cityId)
        networkClient.startService(service, completion: onCompletion)
    }
}
