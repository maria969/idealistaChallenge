//
//  AdDetailRouter.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation

public class AdDetailRouter: AdDetailRouterInterface {
    
    // MARK: - Public Properties
    
    public weak var view: ViewControllerRepresentable?
    
    // MARK: - Public Methods
    
    public static func createAdDetailView(withAd ad: AdEntity) -> any AdDetailViewControllerInterface {
        
        let client = ApiRequester.sharedInstance
        
        let interactor = AdDetailInteractor(adDetailApiSource: AdDetailApiSource(client: client))
        
        let router = AdDetailRouter()
        
        let presenter = AdDetailPresenter(interactor: interactor,
                                          router: router)
        
        let view = AdDetailViewController(presenter: presenter)
        presenter.assignView(view)
        router.assignView(view)
        
        return view
    }
}
