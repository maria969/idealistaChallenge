//
//  ParkingSpaceApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public class ParkingSpaceApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let hasParkingSpace: Bool
    public let isParkingSpaeceIncludedInPrice:  Bool
    
    // MARK: - CodingKeys
    
    enum CodingKeys: CodingKey {
        case hasParkingSpace
        case isParkingSpaeceIncludedInPrice
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hasParkingSpace = try container.decode(Bool.self, forKey: .hasParkingSpace)
        self.isParkingSpaeceIncludedInPrice = try container.decode(Bool.self, forKey: .isParkingSpaeceIncludedInPrice)
    }
}
