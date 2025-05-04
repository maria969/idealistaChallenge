//
//  AppDelegate.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 2/5/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainNavigationController: NavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        configureEntryPoint(withLaunchingWithOptions: launchOptions)
        return true
    }

    // MARK: - Private Methods
    
    private func configureEntryPoint(withLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let adsVC = AdsRouter.createAdsView()
        mainNavigationController = NavigationController(rootViewController: adsVC.viewController)
        
        window?.rootViewController = mainNavigationController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
    }
}

