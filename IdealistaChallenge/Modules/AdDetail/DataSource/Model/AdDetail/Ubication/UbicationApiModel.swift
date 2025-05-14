//
//  UbicationApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//
import Foundation

public class UbicationApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let latitude: Float
    public let longitude: Float
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.latitude = try container.decode(Float.self, forKey: .latitude)
        self.longitude = try container.decode(Float.self, forKey: .longitude)
    }
}
