//
//  AdDetailApiSource.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation

public class AdDetailApiSource: AdDetailApiSourceInterface {
    
    // MARK: - Public Properties
    
    public let apiRequester: ApiRequesterInterface
    public var queue: DispatchQueue = .main
    
    // MARK: - Private properties
    
    private let mapper = AdDetailApiMapper()
    
    // MARK: - Initializers
    
    public init(client: ApiRequesterInterface) {
        self.apiRequester = client
    }
    
    // MARK: - Public Methods
    
    public func getAd(success: @escaping (AdDetailEntity) -> Void,
                      failure: @escaping (ErrorEntity) -> Void) {
        
        
        let onSuccess: (AdDetailApiModel) -> Void = { adDetailApiModel in
            
            let adDetailEntity = self.mapper.map(adDetail: adDetailApiModel)
            success(adDetailEntity)
            print(adDetailEntity)
        }
        
        let onFailure: (ErrorApiModel) -> Void = { (apiError) in
            failure(ErrorEntity(error: apiError))
        }
        
        request(ApiPath().getURL(path: .detail),
                success: onSuccess,
                failure: onFailure)
    }
}

