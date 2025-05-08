//
//  FeatureEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public class FeatureEntity {
    
    // MARK: - Public Properties
    
    public let hasAirConditioning: Bool
    public let hasBoxRoom: Bool
    public let hasSwimmingPool: Bool?
    public let hasTerrace: Bool?
    public let hasGarden: Bool?
    
    // MARK: - Initializers
    
    public init(hasAirConditioning: Bool,
                hasBoxRoom: Bool,
                hasSwimmingPool: Bool?,
                hasTerrace: Bool?,
                hasGarden: Bool?) {
        self.hasAirConditioning = hasAirConditioning
        self.hasBoxRoom = hasBoxRoom
        self.hasSwimmingPool = hasSwimmingPool
        self.hasTerrace = hasTerrace
        self.hasGarden = hasGarden
    }
}
