//
//  AdDetailApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation

public class AdDetailApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let adid: Int
    public let price: Float
    public let priceInfo: PriceApiModel
    public let operation: OperationEnumApiModel
    public let propertyType: String
    public let extendedPropertyType: String
    public let homeType: String
    public let state: String
    public let multimedia: MultimediaApiModel
    public let propertyComment: String
    public let ubication: UbicationApiModel
    public let country: String
    public let moreCharacteristics: CharacteristicsApiModel
    public let energyCertification: EnergyCertificationApiModel
    
    // MARK: - CodingKeys
    
    private enum CodingKeys: String, CodingKey {
        case adid
        case price
        case priceInfo
        case operation
        case propertyType
        case extendedPropertyType
        case homeType
        case state
        case multimedia
        case propertyComment
        case ubication
        case country
        case moreCharacteristics
        case energyCertification
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.adid = try container.decode(Int.self, forKey: .adid)
        self.price = try container.decode(Float.self, forKey: .price)
        self.priceInfo = try container.decode(PriceApiModel.self, forKey: .priceInfo)
        self.operation = try container.decode(OperationEnumApiModel.self, forKey: .operation)
        self.propertyType = try container.decode(String.self, forKey: .propertyType)
        self.extendedPropertyType = try container.decode(String.self, forKey: .extendedPropertyType)
        self.homeType = try container.decode(String.self, forKey: .homeType)
        self.state = try container.decode(String.self, forKey: .state)
        self.multimedia = try container.decode(MultimediaApiModel.self, forKey: .multimedia)
        self.propertyComment = try container.decode(String.self, forKey: .propertyComment)
        self.ubication = try container.decode(UbicationApiModel.self, forKey: .ubication)
        self.country = try container.decode(String.self, forKey: .country)
        self.moreCharacteristics = try container.decode(CharacteristicsApiModel.self, forKey: .moreCharacteristics)
        self.energyCertification = try container.decode(EnergyCertificationApiModel.self, forKey: .energyCertification)
    }
}



