//
//  SceneDelegate.swift
//  Weather App
//
//  Created by Shiv Vaishnav on 01/04/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
            guard let scene = (scene as? UIWindowScene) else { return }
            guard let citiesNVC = scene.windows.first?.rootViewController as? UINavigationController,
                  let citiesVC = citiesNVC.viewControllers.first as? CitiesViewController else {
                return
            }
            citiesVC.citiesViewModel = CitiesViewModel(worker: CitiesWorker())
        }
}
