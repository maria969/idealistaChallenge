//
//  CharacteristicsApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//
import Foundation

public class CharacteristicsApiModel: Decodable {
    
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
    
    // MARK: - CodingKeys
    
    enum CodingKeys: String, CodingKey {
        case communityCosts
        case roomNumber
        case bathNumber
        case exterior
        case housingFurnitures
        case agencyIsABank
        case energyCertificationType
        case flatLocation
        case modificationDate
        case constructedArea
        case lift
        case boxroom
        case isDuplex
        case floor
        case status
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.communityCosts = try container.decode(Float.self, forKey: .communityCosts)
        self.roomNumber = try container.decode(Int.self, forKey: .roomNumber)
        self.bathNumber = try container.decode(Int.self, forKey: .bathNumber)
        self.exterior = try container.decode(Bool.self, forKey: .exterior)
        self.housingFurnitures = try container.decode(String.self, forKey: .housingFurnitures)
        self.agencyIsABank = try container.decode(Bool.self, forKey: .agencyIsABank)
        self.energyCertificationType = try container.decode(String.self, forKey: .energyCertificationType)
        self.flatLocation = try container.decode(String.self, forKey: .flatLocation)
        self.modificationDate = try container.decode(Int.self, forKey: .modificationDate)
        self.constructedArea = try container.decode(Int.self, forKey: .constructedArea)
        self.lift = try container.decode(Bool.self, forKey: .lift)
        self.boxroom = try container.decode(Bool.self, forKey: .boxroom)
        self.isDuplex = try container.decode(Bool.self, forKey: .isDuplex)
        self.floor = try container.decode(String.self, forKey: .floor)
        self.status = try container.decode(String.self, forKey: .status)
    }
}
