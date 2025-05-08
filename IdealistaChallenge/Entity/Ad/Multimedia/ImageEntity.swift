//
//  ImageEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public class ImageEntity {
    
    // MARK: - Public Properties
    
    public let url: String
    public let tag: String
    
    // MARK: - Initializers
    
    public init(url: String,
                tag: String) {
        self.url = url
        self.tag = tag
    }
}
