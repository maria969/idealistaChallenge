//
//  UbicationEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation

public class UbicationEntity {
    
    // MARK: - Public Properties
    
    public let latitude: Double
    public let longitude: Double
    
    // MARK: - Initializers
    
    public required init(latitude: Double,
                         longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
