//
//  AdsCoreDataInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 18/5/25.
//

import Foundation

public protocol AdsCoreDataInterface {
    func saveAdFav(ad: AdEntity , completion: @escaping (AdFav?) -> Void, failure: (ErrorEntity) -> Void)
    func deleteAdFav(ad: AdEntity , completion: @escaping () -> Void, failure: (ErrorEntity) -> Void)
    func isFav(ad: AdEntity) -> Bool
    func getFav(ad: AdEntity, completion: @escaping (AdFav) -> Void, failure: (ErrorEntity) -> Void)
}
