//
//  ForecastTableViewCell.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

import UIKit
import SwiftIcons

class ForecastTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var dayLabel: UILabel!
    @IBOutlet private(set) weak var dateLabel: UILabel!
    @IBOutlet private(set) weak var cloudIcon: UIImageView!
    @IBOutlet private(set) weak var maxTempLabel: UILabel!
    @IBOutlet private(set) weak var lowTempLabel: UILabel!
    @IBOutlet private(set) weak var weatherDescriptionLabel: UILabel!

    var forecast: DailyForecasts? {
        didSet {
            setupView(forecast: forecast)
        }
    }

    private func setupView(forecast: DailyForecasts?) {
        guard let forecast = forecast else { return }

        dayLabel.text = forecast.dayValue
        dateLabel.text = forecast.dateValue
        maxTempLabel.text = forecast.maxTemp
        lowTempLabel.text = forecast.minTemp
        weatherDescriptionLabel.text = forecast.summary
        cloudIcon.setIcon(icon: forecast.iconFont)
    }
}
