//
//  LoadingCellRepresentable.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public protocol LoadingCellRepresentable {
    func willStartLoading()
    func startLoading()
    func willShowRetryButton()
}
