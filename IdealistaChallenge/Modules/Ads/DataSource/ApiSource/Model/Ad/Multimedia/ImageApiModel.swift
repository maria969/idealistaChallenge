//
//  ImageApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//


import Foundation

public class ImageApiModel: Decodable {
    
    // MARK: - Public Properties
    
    public let url: String
    public let tag: String
    
    // MARK: - CodingKeys
    
    enum CodingKeys: CodingKey {
        case url
        case tag
    }
    
    // MARK: - Initializers
    
    public required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.tag = try container.decode(String.self, forKey: .tag)
    }
}
