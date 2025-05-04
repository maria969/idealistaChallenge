//
//  PriceApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//


public class PriceApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let amount: Float
    public let currencySuffix: String
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case amount
        case currencySuffix
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decode(Float.self, forKey: .amount)
        self.currencySuffix = try container.decode(String.self, forKey: .currencySuffix)
    }
}