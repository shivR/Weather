//
//  CityModel.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

struct CityModel: Codable {
    let cityId: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case cityId = "Key"
        case name = "EnglishName"
    }
}
