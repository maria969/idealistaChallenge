//
//  AdApiMapper.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public class AdApiMapper {
    
    // MARK: - Public Methods
    
    public func map(adsApiModel: [AdApiModel]) -> [AdEntity] {
        return adsApiModel.map { map(ad: $0) }
    }
    
    public func map(ad: AdApiModel) -> AdEntity {
        return AdEntity(propertyCode: ad.propertyCode,
                        thumbnailUrl: ad.thumbnailUrl,
                        floor: ad.floor,
                        price: ad.price,
                        priceInfo: map(priceInfo: ad.priceInfo),
                        propertyType: ad.propertyType,
                        operation: map(operation: ad.operation),
                        size: ad.size,
                        exterior: ad.exterior,
                        rooms: ad.rooms,
                        bathrooms: ad.bathrooms,
                        address: ad.address,
                        province: ad.province,
                        municipality: ad.municipality,
                        district: ad.district,
                        country: ad.country,
                        neighborhood: ad.neighborhood,
                        latitude: ad.latitude,
                        longitude: ad.longitude,
                        description: ad.description,
                        multimedia: map(multimedia: ad.multimedia),
                        features: map(features: ad.features),
                        parkingSpace: map(parkingSpace: ad.parkingSpace))
    }
    
    // MARK: - Private Methods
    
    private func map(priceInfo: PriceInfoApiModel) -> PriceEntity {
        PriceEntity(amount: priceInfo.price.amount,
                    currencySuffix: priceInfo.price.currencySuffix)
    }
    
    private func map(operation: OperationEnumApiModel) -> OperationEnumEntity {
        switch operation {
        case .sale: .sale
        case .rent: .rent
        }
    }
    
    private func map(multimedia: MultimediaApiModel) -> [ImageEntity] {
        multimedia.images.map { ImageEntity(url: $0.url, tag: $0.tag) }
    }
    
    private func map(features: FeatureApiModel) -> FeatureEntity {
        FeatureEntity(hasAirConditioning: features.hasAirConditioning,
                      hasBoxRoom: features.hasBoxRoom,
                      hasSwimmingPool: features.hasSwimmingPool,
                      hasTerrace: features.hasTerrace,
                      hasGarden: features.hasGarden)
    }
    
    private func map(parkingSpace: ParkingSpaceApiModel?) -> ParkingSpaceEntity? {
        guard let parkingSpace = parkingSpace else { return nil }
        return ParkingSpaceEntity(hasParkingSpace: parkingSpace.hasParkingSpace,
                           isParkingSpaeceIncludedInPrice: parkingSpace.isParkingSpaeceIncludedInPrice)
    }
}
