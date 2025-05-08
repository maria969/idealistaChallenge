//
//  EnvironmentManagerInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public protocol EnvironmentManagerInterface: AnyObject {
    func getEnvironment() -> EnvironmentRepresentable
}
