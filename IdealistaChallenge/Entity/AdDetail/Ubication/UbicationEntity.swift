//
//  UbicationEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation

public class UbicationEntity {
    
    // MARK: - Public Properties
    
    public let latitude: Float
    public let longitude: Float
    
    // MARK: - Initializers
    
    public required init(latitude: Float,
                         longitude: Float) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
