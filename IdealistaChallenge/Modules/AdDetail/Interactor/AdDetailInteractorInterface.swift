//
//  AdDetailInteractorInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation

public protocol AdDetailInteractorInterface: Interactor {
    func getAdDetail(completion: @escaping (AdDetailEntity) -> Void)
}
