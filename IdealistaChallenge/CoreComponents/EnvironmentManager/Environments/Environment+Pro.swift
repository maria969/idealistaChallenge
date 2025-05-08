//
//  Environment+Pro.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public class Environment: EnvironmentRepresentable {
    
    // MARK: - Public Methods
    
    public func serverURL() -> ServerURL {
        return ServerURL(host: "idealista.github.io/ios-challenge")
    }
}
