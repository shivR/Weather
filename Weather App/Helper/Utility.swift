//
//  Utility.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 02/04/2023.
//

import Foundation

extension DateFormatter {
    static func dateFormatter(dateFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter
    }
}

extension String {
    func getFormattedDate(format: String = "dd MMM yyyy") -> String {
        var dateFormatter = DateFormatter.dateFormatter()
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter = DateFormatter.dateFormatter(dateFormat: format)
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
}

extension Double {
    var toCelsius: Double {
        return (self - 32) / 1.8
    }
}

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
