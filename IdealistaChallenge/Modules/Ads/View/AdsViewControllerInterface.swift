//
//  AdsViewControllerInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public protocol AdsViewControllerInterface: ViewControllerRepresentable {
    func showListModules(_ modules: [CellRepresentable])
    func addListModules(_ modules: [CellRepresentable])
}
