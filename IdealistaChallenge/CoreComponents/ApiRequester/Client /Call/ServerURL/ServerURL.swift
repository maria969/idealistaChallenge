//
//  ServerURL.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public final class ServerURL {
    
    // MARK: - Public Properties
    
    public var baseURL: URL {
        return URL(string: apiPath)!
    }
    
    public static var empty: ServerURL { return ServerURL(host: "") }
    
    // MARK: - Private Properties
    
    private static let URLFormat: String = "%@://%@"
    
    private let apiPath: String
    
    // MARK: - Initializers
    
    public required init(host: String,
                         isSecure: Bool = true) {
        let scheme = ServerURL.scheme(for: isSecure)
        self.apiPath = String(format: ServerURL.URLFormat, scheme, host)
    }
    
    // MARK: - Private Methods
    
    private class func scheme(for secure: Bool) -> String {
        if secure {
            return ApiConstants.Identifiers.HTTPS
        } else {
            return ApiConstants.Identifiers.HTTP
        }
    }
}
