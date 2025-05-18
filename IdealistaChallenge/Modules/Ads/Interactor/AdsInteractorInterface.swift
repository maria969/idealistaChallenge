//
//  AdsInteractorInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public protocol AdsInteractorInterface: Interactor {
    func getAds(success: @escaping([AdEntity]) -> Void,
                failure: @escaping(ErrorEntity) -> Void)
    func updateAdFav(ad: AdEntity,
                     success: @escaping () -> Void,
                     failure: @escaping (ErrorEntity) -> Void)
}
