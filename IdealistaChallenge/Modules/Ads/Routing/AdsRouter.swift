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
        let router = AdsRouter()
        
        let presenter = AdsPresenter()
        
        let view = AdsViewController(presenter: presenter)
        presenter.assignView(view)
        router.assignView(view)
        
        return view
    }
}
