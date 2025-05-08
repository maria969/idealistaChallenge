//
//  APIPath.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public enum APIPath {
    
    public enum Path {}
}

public typealias APIPaths = APIPath.Path

// MARK: - Chats

extension APIPath.Path {
    
    public enum Ads: String, APIPathConvertible {
        case list = ""
    }
}
