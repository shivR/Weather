//
//  CitiesViewController.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

import UIKit

class CitiesViewController: UITableViewController {
    var citiesViewModel: CitiesViewModelLogic?

    private struct Constant {
        static let cellIdentifier = "cell"
        static let cellNib = "CityTableViewCell"
        static let detailView = "detail"
    }

    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(
            UINib(nibName: Constant.cellNib, bundle: .main),
            forCellReuseIdentifier: Constant.cellIdentifier
        )

        setupListeners()
        citiesViewModel?.fetchCities()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? ForecastViewController,
              let city = sender as? CityModel
        else { return }

        detailVC.forecastViewModel = ForecastViewModel(worker: ForecastWorker(), city: city)
    }
}

// MARK: ViewModel listener
extension CitiesViewController {
    private func setupListeners() {
        citiesViewModel?.reloadView = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        citiesViewModel?.showIndicator = {[weak self] shouldShow in
            guard let self = self else { return }
            DispatchQueue.main.async {
                shouldShow ? self.showIndicator() : self.hideIndicator()
            }
        }

        citiesViewModel?.showError = {[weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showAlert(message: error)
            }
        }
    }
}

// MARK: TVC DataSource
extension CitiesViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesViewModel?.numberOfRows ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: Constant.cellIdentifier,
            for: indexPath) as? CityTableViewCell
        else { return UITableViewCell() }

        cell.cityName = citiesViewModel?.itemAtIndex(index: indexPath.row)?.name
        return cell
    }
}

// MARK: TVC Delegates
extension CitiesViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: Constant.detailView, sender: citiesViewModel?.itemAtIndex(index: indexPath.row))
    }
}
