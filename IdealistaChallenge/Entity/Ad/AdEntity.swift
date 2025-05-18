//
//  AdEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation


public class AdEntity {

    // MARK: - Public Properties
    
    public let propertyCode: String
    public let thumbnailUrl: String
    public let floor: String
    public let price: Float
    public let priceInfo: PriceEntity
    public let propertyType: String
    public let operation: OperationEnumEntity
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
    public let multimedia: [ImageEntity]
    public let features: FeatureEntity
    public let parkingSpace: ParkingSpaceEntity?
    public var isFav: Bool
    public var favDate: Date?
    
    // MARK: - Initializers
    
    public required init(propertyCode: String,
                         thumbnailUrl: String,
                         floor: String,
                         price: Float,
                         priceInfo: PriceEntity,
                         propertyType: String,
                         operation: OperationEnumEntity,
                         size: Float, exterior: Bool,
                         rooms: Int,
                         bathrooms: Int,
                         address: String,
                         province: String,
                         municipality: String,
                         district: String,
                         country: String,
                         neighborhood: String,
                         latitude: Float,
                         longitude: Float,
                         description: String,
                         multimedia: [ImageEntity],
                         features: FeatureEntity,
                         parkingSpace: ParkingSpaceEntity?,
                         isFav: Bool = false) {
        self.propertyCode = propertyCode
        self.thumbnailUrl = thumbnailUrl
        self.floor = floor
        self.price = price
        self.priceInfo = priceInfo
        self.propertyType = propertyType
        self.operation = operation
        self.size = size
        self.exterior = exterior
        self.rooms = rooms
        self.bathrooms = bathrooms
        self.address = address
        self.province = province
        self.municipality = municipality
        self.district = district
        self.country = country
        self.neighborhood = neighborhood
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.multimedia = multimedia
        self.features = features
        self.parkingSpace = parkingSpace
        self.isFav = isFav
    }
}
