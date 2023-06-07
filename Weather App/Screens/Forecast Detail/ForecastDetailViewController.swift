//
//  ForecastDetailViewController.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 02/04/2023.
//

import UIKit

class ForecastDetailViewController: UIViewController {
    var forecastDetailViewModel: ForecastDetailViewModelLogic?

    private struct Constants {
        static let cellNib = "ForecastDetailTableViewCell"
        static let cellIdentifier = "cell"
        static let cityNameLabelIdentifier = "cityNameLabel"
    }

    @IBOutlet private(set) weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: Constants.cellNib, bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: Constants.cellIdentifier)
        }
    }
}

// MARK: TVC Datasources and Delegates
extension ForecastDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1: return 1
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = UITableViewCell()
            cell.textLabel?.textAlignment = .center
            cell.accessibilityIdentifier = Constants.cellIdentifier
            cell.textLabel?.accessibilityIdentifier = Constants.cityNameLabelIdentifier
            cell.textLabel?.text = forecastDetailViewModel?.cityName
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.cellIdentifier,
                for: indexPath) as? ForecastDetailTableViewCell
            else {
                return UITableViewCell()
            }
            cell.forecast = forecastDetailViewModel?.forecast
            return cell
        default:
            return UITableViewCell()
        }
    }
}
