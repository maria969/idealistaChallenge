//
//  AdDetailEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation

public class AdDetailEntity {
    
    
    // MARK: - Public Properties
    
    public let adid: Int
    public let price: Float
    public let priceInfo: PriceEntity
    public let operation: OperationEnumEntity
    public let propertyType: String
    public let extendedPropertyType: String
    public let homeType: String
    public let state: String
    public let multimedia: [ImageEntity]
    public let propertyComment: String
    public let ubication: UbicationEntity
    public let country: String
    public let moreCharacteristics: CharacteristicsEntity
    public let energyCertification: EnergyCertificationEntity
    
    // MARK: - Initializers
    
    public required init(adid: Int,
                         price: Float,
                         priceInfo: PriceEntity,
                         operation: OperationEnumEntity,
                         propertyType: String,
                         extendedPropertyType: String,
                         homeType: String,
                         state: String,
                         multimedia: [ImageEntity],
                         propertyComment: String,
                         ubication: UbicationEntity,
                         country: String,
                         moreCharacteristics: CharacteristicsEntity,
                         energyCertification: EnergyCertificationEntity) {
        self.adid = adid
        self.price = price
        self.priceInfo = priceInfo
        self.operation = operation
        self.propertyType = propertyType
        self.extendedPropertyType = extendedPropertyType
        self.homeType = homeType
        self.state = state
        self.multimedia = multimedia
        self.propertyComment = propertyComment
        self.ubication = ubication
        self.country = country
        self.moreCharacteristics = moreCharacteristics
        self.energyCertification = energyCertification
    }
}
