//
//  Service.swift
//  Weather App
//
//  Created by Shiv V on 23/08/22.
//

import Foundation

enum HttpMethod: String {
    case GET
}

protocol ResponseParser {
    func parse(_ data: Data) -> Any?
}

protocol BaseService {
    var endpoint: String { get }
    var httpMethod: String { get }
    var requestParameters: [String: String]? { get }
    var responseParser: ResponseParser? { get }
}
