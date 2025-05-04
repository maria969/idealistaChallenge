//
//  FeatureApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public class FeatureApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let hasAirConditioning: Bool
    public let hasBoxRoom: Bool
    public let hasSwimmingPool: Bool?
    public let hasTerrace: Bool?
    public let hasGarden: Bool?
    
    // MARK: - CodingKeys
    
    enum CodingKeys: CodingKey {
        case hasAirConditioning
        case hasBoxRoom
        case hasSwimmingPool
        case hasTerrace
        case hasGarden
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hasAirConditioning = try container.decode(Bool.self, forKey: .hasAirConditioning)
        self.hasBoxRoom = try container.decode(Bool.self, forKey: .hasBoxRoom)
        self.hasSwimmingPool = try container.decodeIfPresent(Bool.self, forKey: .hasSwimmingPool)
        self.hasTerrace = try container.decodeIfPresent(Bool.self, forKey: .hasTerrace)
        self.hasGarden = try container.decodeIfPresent(Bool.self, forKey: .hasGarden)
    }
}
