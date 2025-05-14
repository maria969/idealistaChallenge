//
//  AdDetailApiSourceInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation

public protocol AdDetailApiSourceInterface: ApiSource {
    func getAd(success: @escaping (AdDetailEntity) -> Void,
                  failure: @escaping (ErrorEntity) -> Void)
}
