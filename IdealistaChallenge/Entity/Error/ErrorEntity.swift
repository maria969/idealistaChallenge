//
//  ErrorEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public class ErrorEntity {
    
    public enum Code {
        case serverError(Int)
        case other
    }
    
    // MARK: - Public Properties
    
    public let code: ErrorEntity.Code
    public let message: String
    
    // MARK: - Initializers
    
    public required init(code: ErrorEntity.Code,
                         message: String) {
        self.code = code
        self.message = message
    }
}
