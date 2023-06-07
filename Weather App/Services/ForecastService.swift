//
//  ForecastService.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

class ForecastService: BaseService {
    private struct Constants {
        static let path = "/forecasts/v1/daily/5day/"
        static let detailKey = "details"
        static let detailsValue = "true"
    }

    private var locationKey: String

    var endpoint: String {
        Constants.path + locationKey
    }

    var httpMethod: String {
        return HttpMethod.GET.rawValue
    }

    var requestParameters: [String: String]? = [:]

    var responseParser: ResponseParser? {
        GenericParser<ForecastModel>()
    }

    init(locationKey: String) {
        self.locationKey = locationKey
        self.requestParameters?[Constants.detailKey] = Constants.detailsValue
    }
}
