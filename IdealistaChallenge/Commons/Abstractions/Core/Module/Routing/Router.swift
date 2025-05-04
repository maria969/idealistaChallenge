//
//  Router.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public protocol Router: AnyObject {
    
    var view: ViewControllerRepresentable? { get set }
    
    func assignView(_ view: ViewControllerRepresentable)
}

extension Router {
    
    // MARK: - Public Methods
    
    public func assignView(_ view: ViewControllerRepresentable) {
        self.view = view
    }
}
