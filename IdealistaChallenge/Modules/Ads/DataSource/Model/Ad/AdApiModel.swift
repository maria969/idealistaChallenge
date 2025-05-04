//
//  AdApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public class AdApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let propertyCode: Int
    public let thumbnailUrl: String
    public let floor: String
    public let price: Float
    public let priceInfo: PriceInfoApiModel
    public let propertyType: String
    public let operation: OperationEnumApiModel
    public let size: Float
    public let exterior: Bool
    public let rooms: Int
    public let bathrooms: Int
    public let address: String
    public let province: String
    public let municipality: String
    public let district: String
    public let country: String
    public let neighborhood: String
    public let latitude: Float
    public let longitude: Float
    public let description: String
    public let multimedia: MultimediaApiModel
    public let features: FeatureApiModel
    public let parkingSpace: ParkingSpaceApiModel?
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case propertyCode
        case thumbnailUrl = "thumbnail"
        case floor
        case price
        case priceInfo
        case propertyType
        case operation
        case size
        case exterior
        case rooms
        case bathrooms
        case address
        case province
        case municipality
        case district
        case country
        case neighborhood
        case latitude
        case longitude
        case description
        case multimedia
        case features
        case parkingSpace
        
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.propertyCode = try container.decode(Int.self, forKey: .propertyCode)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        self.floor = try container.decode(String.self, forKey: .floor)
        self.price = try container.decode(Float.self, forKey: .price)
        self.priceInfo = try container.decode(PriceInfoApiModel.self, forKey: .priceInfo)
        self.propertyType = try container.decode(String.self, forKey: .propertyType)
        self.operation = try container.decode(OperationEnumApiModel.self, forKey: .operation)
        self.size = try container.decode(Float.self, forKey: .size)
        self.exterior = try container.decode(Bool.self, forKey: .exterior)
        self.rooms = try container.decode(Int.self, forKey: .rooms)
        self.bathrooms = try container.decode(Int.self, forKey: .bathrooms)
        self.address = try container.decode(String.self, forKey: .address)
        self.province = try container.decode(String.self, forKey: .province)
        self.municipality = try container.decode(String.self, forKey: .municipality)
        self.district = try container.decode(String.self, forKey: .district)
        self.country = try container.decode(String.self, forKey: .country)
        self.neighborhood = try container.decode(String.self, forKey: .neighborhood)
        self.latitude = try container.decode(Float.self, forKey: .latitude)
        self.longitude = try container.decode(Float.self, forKey: .longitude)
        self.description = try container.decode(String.self, forKey: .description)
        self.multimedia = try container.decode(MultimediaApiModel.self, forKey: .multimedia)
        self.features = try container.decode(FeatureApiModel.self, forKey: .features)
        self.parkingSpace = try container.decodeIfPresent(ParkingSpaceApiModel.self, forKey: .parkingSpace)
    }
}
