//
//  AdsApiSource.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public class AdsApiSource: AdsApiSourceInterface {
    
    // MARK: - Public Properties
    
    public let apiRequester: ApiRequesterInterface
    public var queue: DispatchQueue = .main
    
    // MARK: - Private properties
    
    private let mapper = AdApiMapper()
    
    // MARK: - Initializers
    
    public init(client: ApiRequesterInterface) {
        self.apiRequester = client
    }
    
    // MARK: - Public Methods
    
    public func getAds(success: @escaping ([AdEntity]) -> Void,
                       failure: @escaping (ErrorEntity) -> Void) {
        
        
        let onSuccess: ([AdApiModel]) -> Void = { (ads) in
            
            let adsEntity = self.mapper.map(adsApiModel: ads)
            success(adsEntity)
            print(adsEntity)
        }
        
        let onFailure: (ErrorApiModel) -> Void = { (apiError) in
            failure(ErrorEntity(error: apiError))
        }
        
        request(ApiPath().getURL(path: .list),
                success: onSuccess,
                failure: onFailure)
    }
}

