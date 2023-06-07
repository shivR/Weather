//
//  GenericParser.swift
//  Weather App
//
//  Created by Shiv V on 01/04/2023.
//

import Foundation

class GenericParser <T: Decodable>: ResponseParser {
    func parse(_ data: Data) -> Any? {
        do {
            let parsedData = try JSONDecoder().decode(T.self, from: data)
            return parsedData
        } catch let error {
            return error
        }
    }
}
