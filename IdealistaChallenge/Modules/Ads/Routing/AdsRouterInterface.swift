//
//  AdsRouterInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public protocol AdsRouterInterface: Router {
    static func createAdsView() -> AdsViewControllerInterface
}
