//
//  ParkingSpaceEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public class ParkingSpaceEntity {
    
    // MARK: - Public Properties
    
    public let hasParkingSpace: Bool
    public let isParkingSpaeceIncludedInPrice: Bool?
    
    // MARK: - Initializers
    
    public init(hasParkingSpace: Bool,
                isParkingSpaeceIncludedInPrice: Bool?) {
        self.hasParkingSpace = hasParkingSpace
        self.isParkingSpaeceIncludedInPrice = isParkingSpaeceIncludedInPrice
    }
}
