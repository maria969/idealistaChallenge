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
    private let adsCoreData: AdsCoreDataInterface
    
    // MARK: - Initializers
    
    required init(adsApiSource: AdsApiSourceInterface,
                  adsCoreData: AdsCoreDataInterface) {
        self.adsApiSource = adsApiSource
        self.adsCoreData = adsCoreData
    }
    
    // MARK: - Public Methods
    
    public func getAds(success: @escaping ([AdEntity]) -> Void,
                       failure: @escaping (ErrorEntity) -> Void) {
        
        let safeSuccess: ([AdEntity]) -> Void = { ads in
            
            for ad in ads {
                guard let favorite = self._isFavAd(ad: ad) else {
                    continue
                }
                ad.isFav = true
                ad.favDate = favorite.date
            }
            
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
    
    public func updateAdFav(ad: AdEntity,
                            success: @escaping () -> Void,
                            failure: @escaping (ErrorEntity) -> Void) {
        
        let safeSuccess: () -> Void = {
            self.finish { success() }
        }
        
        let safeFailure: (ErrorEntity) -> Void = { error in
            self.finish { failure(error) }
        }
        
        execute { (interactor: AdsInteractor) in
            interactor._updateFavAd(ad: ad, completion: safeSuccess, failure: safeFailure)
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
    
    private func _isFavAd(ad: AdEntity) -> AdFav? {
        var adFavorite: AdFav? = nil
        
        adsCoreData.getFav(ad: ad) { (adFav) in
            adFavorite = adFav
        } failure: { (error) in
            adFavorite = nil
        }
        
        return adFavorite
    }
    
    private func _updateFavAd(ad: AdEntity, completion: @escaping () -> Void, failure: @escaping (ErrorEntity) -> Void) {
        if ad.isFav {
            adsCoreData.deleteAdFav(ad: ad) {
                completion()
            } failure: { (error) in
                failure(error)
            }

        } else {
            adsCoreData.saveAdFav(ad: ad) { AdFav in
                completion()
            } failure: { (error) in
                failure(error)
            }

        }
    }
}
