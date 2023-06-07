//
//  CityTableViewCell.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    @IBOutlet private(set) weak var cityNameLabel: UILabel!

    var cityName: String? {
        didSet {
            cityNameLabel.text = cityName
        }
    }
}
