//
//  CharacteristicsEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation

public class CharacteristicsEntity {
    
    // MARK: - Public Properties
    
    public let communityCosts: Float
    public let roomNumber: Int
    public let bathNumber: Int
    public let exterior: Bool
    public let housingFurnitures: String
    public let agencyIsABank: Bool
    public let energyCertificationType: String
    public let flatLocation: String
    public let modificationDate: Int
    public let constructedArea: Int
    public let lift: Bool
    public let boxroom: Bool
    public let isDuplex: Bool
    public let floor: String
    public let status: String
    
    // MARK: - Initializers
    
    public init(communityCosts: Float,
                roomNumber: Int,
                bathNumber: Int,
                exterior: Bool,
                housingFurnitures: String,
                agencyIsABank: Bool,
                energyCertificationType: String,
                flatLocation: String,
                modificationDate: Int,
                constructedArea: Int,
                lift: Bool,
                boxroom: Bool,
                isDuplex: Bool,
                floor: String,
                status: String) {
        self.communityCosts = communityCosts
        self.roomNumber = roomNumber
        self.bathNumber = bathNumber
        self.exterior = exterior
        self.housingFurnitures = housingFurnitures
        self.agencyIsABank = agencyIsABank
        self.energyCertificationType = energyCertificationType
        self.flatLocation = flatLocation
        self.modificationDate = modificationDate
        self.constructedArea = constructedArea
        self.lift = lift
        self.boxroom = boxroom
        self.isDuplex = isDuplex
        self.floor = floor
        self.status = status
    }
}
