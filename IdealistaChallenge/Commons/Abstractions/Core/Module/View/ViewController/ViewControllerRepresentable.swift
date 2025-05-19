//
//  ViewControllerRepresentable.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public protocol ViewControllerRepresentable: ViewRepresentable {
    var loading: LoadingIndicator { get }
    var viewController: UIViewController { get }
    
    func showLoading()
    func hideLoading()
}

extension ViewControllerRepresentable {
    
    // MARK: - Public Properties
    
    public var viewController: UIViewController {
        guard let viewController = self as? UIViewController else {
            let identifier = String(describing: self)
            fatalError("\(identifier) implements ViewControllerRepresentable but is not a UIViewController.")
        }
        return viewController
    }
    
    // MARK: - Public Methods
    
    public func showLoading() {
        loading.start()
    }
    
    public func hideLoading() {
        loading.stop()
    }
}

// MARK: - UIViewController

extension UIViewController {
    
    // MARK: - Public Methods
    
    public func present(viewController: ViewControllerRepresentable,
                      animated flag: Bool,
                      completion: (() -> Void)? = nil) {
        let view = viewController.viewController
        present(view,
                animated: flag,
                completion: completion)
    }
    
    public func showAlertMessage(title: String,
                                 messgae: String,
                                 buttonTitle: String,
                                 completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: messgae,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle,
                                      style: .default,
                                      handler: nil))
        present(alert,
                animated: true,
                completion: completion)
    }
}

// MARK: - UINavigationController

extension UINavigationController {
    
    // MARK: - Public Methods
    
    public func push(viewController: ViewControllerRepresentable, animated: Bool) {
        let view = viewController.viewController
        pushViewController(view,
                           animated: animated)
    }
}
