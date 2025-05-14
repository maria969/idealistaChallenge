//
//  AdDetailViewControllerInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation

public protocol AdDetailViewControllerInterface: ViewControllerRepresentable {
    func showAdDetail(_ modules: [CellRepresentable])
}
