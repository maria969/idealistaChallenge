//
//  EnergyCertificationEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation

public class EnergyCertificationEntity {
 
    // MARK: - Public Properties
    
    public let title: String
    public let energyConsumption: String
    public let emissions: String
    
    // MARK: - Initializers
    
    public required init(title: String,
                         energyConsumption: String,
                         emissions: String) {
        self.title = title
        self.energyConsumption = energyConsumption
        self.emissions = emissions
    }
}
