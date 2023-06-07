//
//  CitiesWorker.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

typealias CitiesResult = Result<[CityModel], Error>

protocol CitiesWorkerLogic {
    func getTopCities(onCompletion: @escaping (CitiesResult) -> Void)
}

final class CitiesWorker: CitiesWorkerLogic {
    private var networkClient: APINetworkClientProtocol

    init(_ networkClient: APINetworkClientProtocol = APINetworkClient()) {
        self.networkClient = networkClient
    }

    func getTopCities(onCompletion: @escaping (CitiesResult) -> Void) {
        let service = LocationService(route: .cities)
        networkClient.startService(service, completion: onCompletion)
    }
}
