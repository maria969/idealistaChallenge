//
//  Presenter.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public protocol Presenter: AnyObject, Queueable {
    
    var view: ViewControllerRepresentable? { get set }
    var workingQueue: DispatchQueue { get }
    
    func assignView(_ view: ViewControllerRepresentable)
}

extension Presenter {
    
    // MARK: - Public Properties
    
    public var workingQueue: DispatchQueue {
        return .main
    }
    
    // MARK: - Public Methods
    
    public func assignView(_ view: ViewControllerRepresentable) {
        self.view = view
    }
}
