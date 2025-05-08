//
//  ApiRequesterInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public protocol ApiRequesterInterface: AnyObject {
    func request<T: Decodable>(_ endpoint: URL,
                               success: @escaping (_ response: T) -> Void,
                               failure: @escaping (_ error: ErrorApiModel) -> Void)
}
