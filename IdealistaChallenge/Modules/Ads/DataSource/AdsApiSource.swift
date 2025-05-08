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
        
        let url = URL(string: "https://idealista.github.io/ios-challenge/list.json")! //TODO: - Add dinamic url
        
        
        let onSuccess: ([AdApiModel]) -> Void = { (ads) in
            
            let adsEntity = self.mapper.map(adsApiModel: ads)
            success(adsEntity)
            print(adsEntity)
        }
        
        request(url, success: onSuccess) { error in
            print(error)
        }
    }
}

