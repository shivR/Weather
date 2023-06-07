//
//  BaseViewModel.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 03/04/23.
//

protocol BaseViewModel {
    var showIndicator: (Bool) -> Void { get set }
    var reloadView: () -> Void { get set }
    var showError: (String) -> Void { get set }
}
