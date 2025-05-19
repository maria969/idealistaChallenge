//
//  ApiRequester.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public final class ApiRequester {
    
    // MARK: - Public Properties
    
    public static let sharedInstance: ApiRequesterInterface = {
        let environment = EnvironmentManager.sharedInstance
        
        return ApiRequester(environmentManager: environment)
    }()
    
    // MARK: - Private Properties
    
    private let environmentManager: EnvironmentManagerInterface
    private let client: ApiClient
    
    // MARK: - Initializers
    
    public required init(environmentManager: EnvironmentManagerInterface) {
        self.environmentManager = environmentManager
        self.client = ApiClient(environment: environmentManager,
                                queue: DispatchQueue(label: "com.mariaherrerovaras.idealistaChallenge.ApiRequester"))
    }
}

// MARK: - ApiRequesterInterface

extension ApiRequester: ApiRequesterInterface {
    
    public func request<T: Decodable>(_ endpoint: URL,
                                      success: @escaping (_ response: T) -> Void,
                                      failure: @escaping (_ error: ErrorApiModel) -> Void) {
        client.request(endpoint,
                       success: success,
                       failure: failure)
    }
}
