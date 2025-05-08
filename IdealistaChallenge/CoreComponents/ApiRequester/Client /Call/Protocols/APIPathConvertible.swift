//
//  APIPathConvertible.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public protocol APIPathConvertible {
    var path: String { get }
}

extension APIPathConvertible where Self: RawRepresentable, Self.RawValue == String {
    
    // MARK: - Public Properties
    
    public var path: String {
        return self.rawValue
    }
}
