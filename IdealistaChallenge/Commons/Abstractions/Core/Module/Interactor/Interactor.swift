//
//  Interactor.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public protocol Interactor: AnyObject, Queueable {
    var invocationQueue: DispatchQueue { get set }
    
    func assignCallback(_ callback: Queueable)
    func execute<T: Interactor>(_ work: @escaping ((_ interactor: T) -> Void))
    func finish(_ work: @escaping (() -> Void))
}

extension Interactor {
    
    // MARK: - Public Methods
    
    public func assignCallback(_ callback: Queueable) {
        invocationQueue = callback.workingQueue
    }
    
    public func execute<T: Interactor>(_ work: @escaping ((_ interactor: T) -> Void)) {
        guard let interactor: T = self as? T else { fatalError() }
        workingQueue.async { work(interactor) }
    }
    
    public func finish(_ work: @escaping (() -> Void)) {
        invocationQueue.async { work() }
    }
}
