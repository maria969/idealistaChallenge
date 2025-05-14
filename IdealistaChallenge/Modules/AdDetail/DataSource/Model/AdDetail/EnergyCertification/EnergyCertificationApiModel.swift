//
//  EnergyCertificationApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation

public class EnergyCertificationApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let title: String
    public let energyConsumption: StringTypeInfo
    public let emissions: StringTypeInfo
    
    // MARK: - CodingKeys
    
    enum CodingKeys: CodingKey {
        case title
        case energyConsumption
        case emissions
    }
    
    // MARK: - Initializers
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.energyConsumption = try container.decode(StringTypeInfo.self, forKey: .energyConsumption)
        self.emissions = try container.decode(StringTypeInfo.self, forKey: .emissions)
    }
}

public class StringTypeInfo: Decodable {
    
    // MARK: - Public Properties
    
    public let type: String
    
    // MARK: - CodingKeys
    
    enum CodingKeys: CodingKey {
        case type
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
    }
}
