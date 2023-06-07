//
//  LocationService.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 30/05/2023.
//

final class LocationService: BaseService {
    enum Routes {
        case cities
    }

    private var route: Routes

    private enum Constants {
        static let cities = "/locations/v1/topcities/50"
    }

    private enum Endpoint {
        case cities

        var path: String {
            switch self {
            case .cities:
                return Constants.cities
            }
        }
    }

    var endpoint: String {
        switch route {
        case .cities:
            return Endpoint.cities.path
        }
    }

    var httpMethod: String {
        switch route {
        case .cities:
            return HttpMethod.GET.rawValue
        }
    }

    var requestParameters: [String: String]? {
        switch route {
        case .cities:
            return nil
        }
    }

    var responseParser: ResponseParser? {
        switch route {
        case .cities:
            return GenericParser<[CityModel]>()
        }
    }

    init(route: Routes) {
        self.route = route
    }
}
