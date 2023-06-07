//
//  ForecastViewController.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

import UIKit
import SwiftIcons

class ForecastViewController: UIViewController {
    var forecastViewModel: ForecastViewModelLogic?

    private struct Constant {
        static let detailView = "detail"
        static let cellNib = "ForecastTableViewCell"
        static let cellIdentifier = "cell"
    }

    @IBOutlet private(set) weak var tableView: UITableView! {
        didSet {
            tableView.register(
                UINib(nibName: Constant.cellNib, bundle: .main),
                forCellReuseIdentifier: Constant.cellIdentifier)
        }
    }

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        title = forecastViewModel?.cityName

        setupListeners()
        forecastViewModel?.getForecast()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == Constant.detailView,
              let destination = segue.destination as? ForecastDetailViewController,
              let data = sender as? DailyForecasts
        else { return }
        destination.forecastDetailViewModel = ForecastDetailViewModel(
            forecast: data,
            cityName: forecastViewModel?.cityName
        )
    }
}

// MARK: ViewModel listeners
extension ForecastViewController {
    private func setupListeners() {
        forecastViewModel?.reloadView = {[weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        forecastViewModel?.showIndicator = {[weak self] shouldShow in
            guard let self = self else { return }
            DispatchQueue.main.async {
                shouldShow ? self.showIndicator() : self.hideIndicator()
            }
        }

        forecastViewModel?.showError = {[weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showAlert(message: error)
            }
        }
    }
}

// MARK: TVC Datasource & Delegates
extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastViewModel?.numberOfRows ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constant.cellIdentifier,
            for: indexPath) as? ForecastTableViewCell
        else { return UITableViewCell() }

        cell.forecast = forecastViewModel?.itemAtIndex(index: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let forecast = forecastViewModel?.itemAtIndex(index: indexPath.row) else { return }
        performSegue(withIdentifier: Constant.detailView, sender: forecast)
    }
}
