//
//  AdDetailApiMapper.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation

public class AdDetailApiMapper {
    
    // MARK: - Public Methods
    
    public func map(adDetail: AdDetailApiModel) -> AdDetailEntity {
        AdDetailEntity(adid: adDetail.adid,
                       price: adDetail.price,
                       priceInfo: map(priceInfo: adDetail.priceInfo),
                       operation: map(operation: adDetail.operation),
                       propertyType: adDetail.propertyType,
                       extendedPropertyType: adDetail.extendedPropertyType,
                       homeType: adDetail.homeType,
                       state: adDetail.state,
                       multimedia: map(multimedia: adDetail.multimedia),
                       propertyComment: adDetail.propertyComment,
                       ubication: map(ubication: adDetail.ubication),
                       country: adDetail.country,
                       moreCharacteristics: map(characteristics: adDetail.moreCharacteristics),
                       energyCertification: map(energyCertification: adDetail.energyCertification))
    }
    
    
    // MARK: - Private Methods
    
    private func map(priceInfo: PriceApiModel) -> PriceEntity {
        PriceEntity(amount: priceInfo.amount,
                    currencySuffix: priceInfo.currencySuffix)
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
    
    private func map(energyCertification: EnergyCertificationApiModel) -> EnergyCertificationEntity {
        EnergyCertificationEntity(title: energyCertification.title,
                                  energyConsumption: energyCertification.energyConsumption.type,
                                  emissions: energyCertification.emissions.type)
    }
    
    private func map(characteristics: CharacteristicsApiModel) -> CharacteristicsEntity {
        CharacteristicsEntity(communityCosts: characteristics.communityCosts,
                              roomNumber: characteristics.roomNumber,
                              bathNumber: characteristics.bathNumber,
                              exterior: characteristics.exterior,
                              housingFurnitures: characteristics.housingFurnitures,
                              agencyIsABank: characteristics.agencyIsABank,
                              energyCertificationType: characteristics.energyCertificationType,
                              flatLocation: characteristics.flatLocation,
                              modificationDate: characteristics.modificationDate,
                              constructedArea: characteristics.constructedArea,
                              lift: characteristics.lift,
                              boxroom: characteristics.boxroom,
                              isDuplex: characteristics.isDuplex,
                              floor: characteristics.floor,
                              status: characteristics.status)
    }
    
    private func map(ubication: UbicationApiModel) -> UbicationEntity {
        UbicationEntity(latitude: Double(ubication.latitude),
                        longitude: Double(ubication.longitude))
    }
}
