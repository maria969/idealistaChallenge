//
//  AdsRouter.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public class AdsRouter: AdsRouterInterface {
    
    // MARK: - Public Properties
    
    public weak var view: ViewControllerRepresentable?
    
    // MARK: - Public Methods
    
    public static func createAdsView() -> AdsViewControllerInterface {
        
        let client = ApiRequester.sharedInstance
        
        let interactor = AdsInteractor(adsApiSource: AdsApiSource(client: client),
                                       adsCoreData: AdsCoreData())
        
        let router = AdsRouter()
        
        let presenter = AdsPresenter(interactor: interactor,
                                     routing: router)
        
        let view = AdsViewController(presenter: presenter)
        presenter.assignView(view)
        router.assignView(view)
        
        return view
    }
    
    public func presentAd(ad: AdEntity) {
        guard let navigationController = view?.viewController.navigationController else { return }
        
        let adDetailVC = AdDetailRouter.createAdDetailView(withAd: ad)
        
        navigationController.push(viewController: adDetailVC,
                                  animated: true)
    }

}
