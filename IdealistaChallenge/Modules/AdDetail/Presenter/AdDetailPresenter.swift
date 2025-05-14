//
//  AdDetailPresenter.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation

public class AdDetailPresenter: AdDetailPresenterInterface {
    
    // MARK: - Public Properties
    
    public weak var view: ViewControllerRepresentable?
    
    // MARK: - Private Properties
    
    private let interactor: AdDetailInteractorInterface
    private let router: AdDetailRouterInterface
    
    private var adDetailView: AdDetailViewControllerInterface? {
        return view as? AdDetailViewControllerInterface
    }
    
    // MARK: - Initializers
    
    public required init(interactor: AdDetailInteractorInterface,
                         router: AdDetailRouterInterface) {
        self.interactor = interactor
        self.router = router
        self.interactor.assignCallback(self)
    }
    
    // MARK: - Public Methods
    
    public func viewDidLoad() {
//        adDetailView?.showLoading()
        interactor.getAdDetail { [weak self] (ad) in
            guard let strongSelf = self else { return }
            let cells = strongSelf.createCells(from: ad)
            strongSelf.adDetailView?.showAdDetail(cells)
            strongSelf.adDetailView?.hideLoading()
        }
        
    }
}

// MARK: - Cells Ui Generation

private extension AdDetailPresenter {
    
    private func createCells(from ad: AdDetailEntity) -> [CellRepresentable] {
        var cells: [CellRepresentable] = []
        
        let detail = AdDetailUiModel(comment: ad.propertyComment,
                                     multimedia: ad.multimedia,
                                     operation: ad.operation.localizedString,
                                     priceInfo: ad.priceInfo,
                                     roomNumber: ad.moreCharacteristics.roomNumber,
                                     bathNumber: ad.moreCharacteristics.bathNumber,
                                     constructedArea: ad.moreCharacteristics.constructedArea,
                                     floor: ad.moreCharacteristics.floor,
                                     flatLocation: ad.moreCharacteristics.flatLocation)
        
        cells.append(detail)
        
        return cells
    }
}
