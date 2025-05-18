//
//  AdsApiSourceInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public protocol AdsApiSourceInterface: ApiSource { 
    func getAds(success: @escaping ([AdEntity]) -> Void,
                  failure: @escaping (ErrorEntity) -> Void)
}
