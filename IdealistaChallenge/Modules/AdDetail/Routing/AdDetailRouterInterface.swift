//
//  AdDetailRouterInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation

public protocol AdDetailRouterInterface: Router {
    static func createAdDetailView(withAd ad: AdEntity) -> AdDetailViewControllerInterface
}
