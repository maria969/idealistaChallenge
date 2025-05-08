//
//  ApiSource.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public protocol ApiSource: AnyObject {
    var apiRequester: ApiRequesterInterface { get }
    var queue: DispatchQueue { get set }
    
    func assignCallback(_ callback: Queueable)
    
    func request<T: Decodable>(_ endpoint: URL,
                                      success: @escaping (_ response: T) -> Void,
                                      failure: @escaping (_ error: ErrorApiModel) -> Void)
}

extension ApiSource {
    
    // MARK: - Public Methods
    
    public func assignCallback(_ callback: Queueable) {
        queue = callback.workingQueue
    }
    
    public func request<T: Decodable>(_ endpoint: URL,
                                      success: @escaping (_ response: T) -> Void,
                                      failure: @escaping (_ error: ErrorApiModel) -> Void) {
        apiRequester.request(endpoint,
                       success: success,
                       failure: failure)
    }
}
