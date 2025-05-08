//
//  AdsInteractor.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public class AdsInteractor: AdsInteractorInterface {
    
    // MARK: -  Public Properties
    public let workingQueue: DispatchQueue = DispatchQueue(label: "com.mariaherrerovaras.idealistachallenge.Interactor")
    public var invocationQueue: DispatchQueue = .main
    
    // MARK: - Private Properties
    
    private let adsApiSource: AdsApiSourceInterface
    
    // MARK: - Initializers
    
    required init(adsApiSource: AdsApiSourceInterface) {
        self.adsApiSource = adsApiSource
    }
    
    // MARK: - Public Methods
    
    public func getAds(success: @escaping ([AdEntity]) -> Void,
                       failure: @escaping (ErrorEntity) -> Void) {
        
        let safeSuccess: ([AdEntity]) -> Void = { ads in
            self.finish { success(ads) }
        }
        
        let safeFailure: (ErrorEntity) -> Void = { error in
            self.finish { failure(error) }
        }
        
        execute { (interactor: AdsInteractor) in
            interactor._getAds(success: safeSuccess,
                               failure: safeFailure)
        }
    }
}

// MARK: - Get Ads

extension AdsInteractor {
    private func _getAds(success: @escaping ([AdEntity]) -> Void,
                         failure: @escaping (ErrorEntity) -> Void) {
        adsApiSource.getAds { (ads) in
            success(ads)
        } failure: { (error) in
            failure(error)
        }

    }
}
