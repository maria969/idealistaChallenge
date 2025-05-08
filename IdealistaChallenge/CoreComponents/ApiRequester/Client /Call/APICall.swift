//
//  APICall.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public enum APICall: APICallConvertible {
    case call(APIPathConvertible)
    case absolutePath(String)
    
    // MARK: - Public Properties
    
    public var path: String {
        switch self {
        case APICall.call(let apiPath):
            return apiPath.path
        case APICall.absolutePath(let path):
            return path
        }
    }
}
