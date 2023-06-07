//
//  ForecastDetailTableViewCell.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 02/04/2023.
//

import UIKit
import SwiftIcons

class ForecastDetailTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var tempLabel: UILabel!
    @IBOutlet private(set) weak var iconImage: UIImageView!
    @IBOutlet private(set) weak var precipitationProbabilityLabel: UILabel!
    @IBOutlet private(set) weak var precipitationLabel: UILabel!
    @IBOutlet private(set) weak var cloudCoverLabel: UILabel!
    @IBOutlet private(set) weak var visibilityLabel: UILabel!
    @IBOutlet private(set) weak var realFeelShadeLabel: UILabel!
    @IBOutlet private(set) weak var realFeelsLabel: UILabel!
    @IBOutlet private(set) weak var windLabel: UILabel!
    @IBOutlet private(set) weak var windGustsLabel: UILabel!
    @IBOutlet private(set) weak var humidityLabel: UILabel!
    @IBOutlet private(set) weak var dewPointLabel: UILabel!

    private struct Constants {
        static let blank = ""
        static let percentage = "%"
        static let degree = "°"
    }

    var forecast: DailyForecasts? {
        didSet {
            updateUI()
        }
    }

    private func updateUI() {
        guard let forecast = forecast else { return }
        iconImage.setIcon(icon: forecast.iconFont)
        precipitationProbabilityLabel.text = "\(forecast.precipitationProbability)" + Constants.percentage
        precipitationLabel.text = forecast.precipitationType
        cloudCoverLabel.text = "\(forecast.cloudCover ?? 0)" + Constants.percentage
        realFeelsLabel.text = "\(NSLocalizedString("RealFeel®", comment: "")) \(forecast.realFeel)" + Constants.degree
        realFeelShadeLabel.text = "\(NSLocalizedString("RealFeel Shade™", comment: "")) \(forecast.realFeelShade)" + Constants.degree
        windLabel.text = forecast.windSpeed
        windGustsLabel.text = forecast.windGustsSpeed
    }
}
