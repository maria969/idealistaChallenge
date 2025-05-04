//
//  MultimediaApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public class MultimediaApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let images: [ImageApiModel]
    
    // MARK: - CodingKeys
    
    enum CodingKeys: CodingKey {
        case images
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.images = try container.decode([ImageApiModel].self, forKey: .images)
    }
}


