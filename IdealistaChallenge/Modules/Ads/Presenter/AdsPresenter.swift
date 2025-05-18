//
//  AdsPresenter.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public class AdsPresenter: AdsPresenterInterface {
    
    // MARK: - Public Properties
    
    public weak var view: ViewControllerRepresentable?
    
    // MARK: - Private Properties
    
    private let interactor: AdsInteractorInterface
    private let routing: AdsRouterInterface
    
    private var adsView: AdsViewControllerInterface? {
        return view as? AdsViewControllerInterface
    }
    
    // MARK: - Initializers
    
    public required init(interactor: AdsInteractorInterface,
                         routing: AdsRouterInterface) {
        self.interactor = interactor
        self.routing = routing
        self.interactor.assignCallback(self)
    }
    
    // MARK: - Public Methods
    
    public func viewDidLoad() {
        loadAds()
    }
    
    // MARK: - Private Methods
    
    private func loadAds() {
        adsView?.showLoading()
        interactor.getAds { [weak self] (ads) in
            guard let strongSelf = self else { return }
            
            let cells = strongSelf.createCells(from: ads)
            strongSelf.adsView?.showListModules(cells)
            strongSelf.view?.hideLoading()
    
        } failure: { [weak self] (error) in
            guard let strongSelf = self else { return }
            
            //TODO: - Show Error
            strongSelf.view?.hideLoading()
        }

    }
}

//MARK: - Cells UI Generation

extension AdsPresenter {
    private func createCells(from ads: [AdEntity]) -> [CellRepresentable] {
        return map(ads: ads)
        
        // TODO: - Create Placeholder
    }
    
    private func map(ads: [AdEntity]) -> [CellRepresentable] {
        return ads.map { ad in
            let dateFormatter = DateFormatter.favDateFormatter
            
            var favDateString: String? = nil
            if let date = ad.favDate {
                favDateString = dateFormatter.string(from: date)
            }
            
            let model = AdUiModel(address: ad.address,
                                  imageURL: URL(string: ad.thumbnailUrl),
                                  propertyType: ad.propertyType,
                                  operation: ad.operation.localizedString,
                                  operationColor: ad.operation.operationColor,
                                  description: ad.description,
                                  isFav: ad.isFav,
                                  favDate: favDateString,
                                  priceInfo: ad.priceInfo)
            
            model.onSelection = { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.routing.presentAd(ad: ad)
            }
            
            model.onClickFavButton = { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.interactor.updateAdFav(ad: ad) {
                    strongSelf.loadAds()
                } failure: { error in
                    print("Error: \(error)")
                }
            }
            
            return model
        }
    }
}
