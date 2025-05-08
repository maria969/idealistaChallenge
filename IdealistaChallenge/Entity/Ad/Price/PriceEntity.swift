//
//  PriceEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public class PriceEntity {
    
    // MARK: - Public Properties
    
    public let amount: Float
    public let currencySuffix: String
    
    // MARK: - Initializers
    
    public init(amount: Float,
                currencySuffix: String) {
        self.amount = amount
        self.currencySuffix = currencySuffix
    }
}
