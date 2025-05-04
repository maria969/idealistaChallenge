//
//  SelectableCellRepresentable.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public protocol SelectableCellRepresentable {
    var onSelection: (() -> Void)? { get }
}
