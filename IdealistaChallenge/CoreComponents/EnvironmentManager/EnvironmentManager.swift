//
//  EnvironmentManager.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public final class EnvironmentManager: EnvironmentManagerInterface {
    
    public static let sharedInstance: EnvironmentManagerInterface = EnvironmentManager()
    
    // MARK: - Private Properties
    
    private let environment: EnvironmentRepresentable
    
    // MARK: - Initializers
    
    public required init() {
        self.environment = Environment()
    }
    
    // MARK: - Public Properties
    
    public func getEnvironment() -> EnvironmentRepresentable {
        return environment
    }
}
