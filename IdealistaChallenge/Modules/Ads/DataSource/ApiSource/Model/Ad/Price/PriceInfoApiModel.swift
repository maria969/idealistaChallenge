//
//  PriceInfoApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public class PriceInfoApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let price: PriceApiModel
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case price
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.price = try container.decode(PriceApiModel.self, forKey: .price)
    }
}


