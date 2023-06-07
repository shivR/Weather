//
//  ForecastModel.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

import SwiftIcons

struct ForecastModel: Codable {
    let headline: Headline?
    let dailyForecasts: [DailyForecasts]?

    enum CodingKeys: String, CodingKey {
        case headline = "Headline"
        case dailyForecasts = "DailyForecasts"
    }
}

struct Headline: Codable {
    let mobileLink: String?
    let link: String?

    enum CodingKeys: String, CodingKey {
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}

struct DailyForecasts: Codable {
    let date: String?
    let epochDate: Int?
    let temperature: Temperature?
    let hoursOfSun: Double?
    let airAndPollen: [AirAndPollen]?
    let day: Day?
    let night: Night?
    let sources: [String]?
    let mobileLink: String?
    let link: String?
    let realFeelTemperature: RealFeelTemperature?
    let realFeelTemperatureShade: RealFeelTemperatureShade?

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case epochDate = "EpochDate"
        case temperature = "Temperature"
        case hoursOfSun = "HoursOfSun"
        case airAndPollen = "AirAndPollen"
        case day = "Day"
        case night = "Night"
        case sources = "Sources"
        case mobileLink = "MobileLink"
        case link = "Link"
        case realFeelTemperature = "RealFeelTemperature"
        case realFeelTemperatureShade = "RealFeelTemperatureShade"
    }
}

struct Temperature: Codable {
    let minimum: TemperatureDetail?
    let maximum: TemperatureDetail?

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

struct TemperatureDetail: Codable {
    let value: Double?
    let unit: String?
    let unitType: Int?
    let phrase: String?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
        case phrase = "Phrase"
    }
}

struct Day: Codable {
    let icon: Int?
    let iconPhrase: String?
    let hasPrecipitation: Bool?
    let precipitationType: String?
    let precipitationIntensity: String?
    let shortPhrase: String?
    let longPhrase: String?
    let precipitationProbability: Int?
    let thunderstormProbability: Int?
    let rainProbability: Int?
    let snowProbability: Int?
    let iceProbability: Int?
    let wind: Wind?
    let windGust: WindGust?
    let hoursOfPrecipitation: Double?
    let hoursOfRain: Double?
    let hoursOfSnow: Double?
    let hoursOfIce: Double?
    let cloudCover: Int?

    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case precipitationIntensity = "PrecipitationIntensity"
        case shortPhrase = "ShortPhrase"
        case longPhrase = "LongPhrase"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case wind = "Wind"
        case windGust = "WindGust"
        case hoursOfPrecipitation = "HoursOfPrecipitation"
        case hoursOfRain = "HoursOfRain"
        case hoursOfSnow = "HoursOfSnow"
        case hoursOfIce = "HoursOfIce"
        case cloudCover = "CloudCover"
    }
}

struct AirAndPollen: Codable {
    let name: String?
    let value: Int?
    let category: String?
    let categoryValue: Int?
    let type: String?

    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case value = "Value"
        case category = "Category"
        case categoryValue = "CategoryValue"
        case type = "Type"
    }
}

struct Wind: Codable {
    let speed: Speed?
    let direction: Direction?

    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
        case direction = "Direction"
    }
}

struct WindGust: Codable {
    let speed: Speed?
    let direction: Direction?

    enum CodingKeys: String, CodingKey {
        case speed = "Speed"
        case direction = "Direction"
    }
}

struct Direction: Codable {
    let degrees: Int?
    let localized: String?
    let english: String?

    enum CodingKeys: String, CodingKey {
        case degrees = "Degrees"
        case localized = "Localized"
        case english = "English"
    }
}

struct Speed: Codable {
    let value: Double?
    let unit: String?
    let unitType: Int?

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}

struct Night: Codable {
    let icon: Int?
    let iconPhrase: String?
    let hasPrecipitation: Bool?
    let precipitationType: String?
    let precipitationIntensity: String?
    let shortPhrase: String?
    let longPhrase: String?
    let precipitationProbability: Int?
    let thunderstormProbability: Int?
    let rainProbability: Int?
    let snowProbability: Int?
    let iceProbability: Int?
    let wind: Wind?
    let windGust: WindGust?
    let hoursOfPrecipitation: Double?
    let hoursOfRain: Double?
    let hoursOfSnow: Double?
    let hoursOfIce: Double?
    let cloudCover: Int?

    enum CodingKeys: String, CodingKey {
        case icon = "Icon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case precipitationType = "PrecipitationType"
        case precipitationIntensity = "PrecipitationIntensity"
        case shortPhrase = "ShortPhrase"
        case longPhrase = "LongPhrase"
        case precipitationProbability = "PrecipitationProbability"
        case thunderstormProbability = "ThunderstormProbability"
        case rainProbability = "RainProbability"
        case snowProbability = "SnowProbability"
        case iceProbability = "IceProbability"
        case wind = "Wind"
        case windGust = "WindGust"
        case hoursOfPrecipitation = "HoursOfPrecipitation"
        case hoursOfRain = "HoursOfRain"
        case hoursOfSnow = "HoursOfSnow"
        case hoursOfIce = "HoursOfIce"
        case cloudCover = "CloudCover"
    }
}

struct RealFeelTemperature: Codable {
    let minimum: TemperatureDetail?
    let maximum: TemperatureDetail?

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

struct RealFeelTemperatureShade: Codable {
    let minimum: TemperatureDetail?
    let maximum: TemperatureDetail?

    enum CodingKeys: String, CodingKey {
        case minimum = "Minimum"
        case maximum = "Maximum"
    }
}

protocol ForecastProtcol {
    var dayValue: String { get }
    var dateValue: String { get }
    var maxTemp: String { get }
    var minTemp: String { get }
    var summary: String { get }
    var icon: Int { get }
    var precipitationProbability: Int { get }
    var precipitationType: String? { get }
    var cloudCover: Int? { get }
    var windSpeed: String? { get }
    var windGustsSpeed: String? { get }
    var realFeel: Int { get }
    var realFeelShade: Int { get }
    var iconFont: FontType { get }
}

extension DailyForecasts: ForecastProtcol {
    var dayValue: String {
        date?.getFormattedDate(format: "EE") ?? ""
    }

    var dateValue: String {
        date?.getFormattedDate(format: "MM/dd") ?? ""
    }

    var maxTemp: String {
        "\(Int((temperature?.maximum?.value ?? 0.0).toCelsius))°"
    }

    var minTemp: String {
        "/\(Int((temperature?.minimum?.value ?? 0.0).toCelsius))°"
    }

    var summary: String {
        day?.shortPhrase ?? ""
    }

    var icon: Int {
        day?.icon ?? 0
    }

    var precipitationProbability: Int {
        day?.precipitationProbability ?? 0
    }

    var precipitationType: String? {
        day?.precipitationType
    }

    var cloudCover: Int? {
        day?.cloudCover
    }

    var windSpeed: String? {
        guard let speed = day?.wind?.speed else { return "" }
        return "\(Int(speed.value ?? 0.0)) \(speed.unit ?? "")"
    }

    var windGustsSpeed: String? {
        guard let speed = day?.windGust?.speed else { return "" }
        return "\(Int(speed.value ?? 0.0)) \(speed.unit ?? "")"
    }

    var realFeel: Int {
        ((Int((realFeelTemperature?.maximum?.value ?? 0.0).toCelsius)))
    }

    var realFeelShade: Int {
        ((Int((realFeelTemperatureShade?.maximum?.value ?? 0.0).toCelsius)))
    }

    var iconFont: FontType {
        switch icon {
        case 0:
            return .weather(.humidity)
        case 1:
            return .weather(.daySunny)
        case 3, 17:
            return .weather(.wuPartlysunny)
        case 35:
            return .weather(.nightPartlyCloudy)
        case 33:
            return .weather(.nightClear)
        default:
            return .weather(.wuSunny)
        }
    }
}
