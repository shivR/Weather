//
//  APINetworkClient.swift
//  Weather App
//
//  Created by Shiv V on 01/04/2023.
//

import Foundation
import Dispatch

protocol APINetworkClientProtocol {
    func startService<T>(
        _ service: BaseService,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T: Codable
}

final class APINetworkClient: NSObject, APINetworkClientProtocol {
    private var session: URLSession?
    private struct Constants {
        static let apiKeyValue = "qLsCaG9u3Kvt9mrgaj6Hj30KEiXWAFYn"
        static let apikey = "apikey"
        static let scheme = "http"
        static let host = "dataservice.accuweather.com"
    }

    override init() {
        super.init()
        session = URLSession.init(configuration: .default)
    }

    func startService<T>(
        _ service: BaseService,
        completion: @escaping (Result<T, Error>) -> Void
    ) where T: Codable {
        guard let request = createRequest(service) else {
            let error = NSError(domain: "RequestInvalid", code: -1)
            completion(.failure(error))
            return
        }

        let task = session?.dataTask(with: request, completionHandler: {[weak self] data, response, error in
            self?.processResponseHandler(forService: service,
                                         data: data,
                                         response: response,
                                         error: error,
                                         completion: completion)
        })
        task?.resume()
    }

    private func createRequest(_ service: BaseService) -> URLRequest? {
        var components = URLComponents()
        components.scheme = Constants.scheme
        components.host = Constants.host
        components.path = service.endpoint
        components.queryItems = [
            URLQueryItem(
                name: Constants.apikey,
                value: Constants.apiKeyValue
            )
        ]

        if let requestParams = service.requestParameters {
            for (key, value) in requestParams {
                components.queryItems?.append(URLQueryItem(name: key, value: value))
            }
        }

        guard let url = components.url else {
            return nil
        }

        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.httpMethod = service.httpMethod
        return request
    }

    private func processResponseHandler<T>(
        forService service: BaseService,
        data: Data?,
        response: URLResponse?,
        error: Error?,
        completion: (Result<T, Error>) -> Void
    ) where T: Codable {
        if let error = error {
            completion(.failure(error))
            return
        }
        guard let data = data else {
            let error = NSError(domain: "NoData", code: -1)
            completion(.failure(error))
            return
        }
        let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
        guard statusCode < 300 else {
            let error = NSError(domain: "InvalidResponse", code: statusCode)
            completion(.failure(error))
            return
        }

        guard let parser = service.responseParser,
              let parsed = parser.parse(data)
        else {
            do {
                guard let jsonResponse = try JSONSerialization.jsonObject(
                    with: data,
                    options: .allowFragments) as? T
                else {
                    completion(.failure(NSError(domain: "InvalidJson", code: -1)))
                    return
                }
                completion(.success(jsonResponse))
            } catch let error {
                completion(.failure(error))
            }
            return
        }

        if let parsedData = parsed as? T {
            completion(.success(parsedData))
        } else if let error = parsed as? Error {
            completion(.failure(error))
        }
    }
}
