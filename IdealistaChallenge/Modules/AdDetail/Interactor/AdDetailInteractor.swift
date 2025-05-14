//
//  AdDetailInteractor.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation

public class AdDetailInteractor: AdDetailInteractorInterface {
    
    // MARK: - Public Properties
    
    public let workingQueue: DispatchQueue = DispatchQueue(label: "com.mariaherrerovaras.idealistachallenge.Interactor")
    public var invocationQueue: DispatchQueue = .main
    
    // MARK: - Private Properties
    
    private let adDetailApiSource: AdDetailApiSourceInterface
    
    // MARK: - Initializers
    
    public required init(adDetailApiSource: AdDetailApiSourceInterface) {
        self.adDetailApiSource = adDetailApiSource
        self.adDetailApiSource.assignCallback(self)
    }
    
    // MARK: - Public Methods
    
    public func getAdDetail(completion: @escaping (AdDetailEntity) -> Void) {
        let safeSuccess: (AdDetailEntity) -> Void = { (adDetail) in
            self.finish { completion(adDetail) }
        }
        
        execute { (interactor: AdDetailInteractor) in
            interactor._getAdDetail(success: safeSuccess)
        }
    }
    
}

// MARK: - Get Ad Detail

extension AdDetailInteractor {
    private func _getAdDetail(success: @escaping (AdDetailEntity) -> Void) {
        adDetailApiSource.getAd(success: success) { [weak self] (error) in
            print(error.message)
        }

    }
}
