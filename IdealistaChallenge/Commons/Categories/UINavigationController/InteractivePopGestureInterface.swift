//
//  InteractivePopGestureInterface.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public protocol InteractivePopGestureInterface: AnyObject {
    func isInteractivePopGestureEnabled() -> Bool
    func navigationControllerWillPopBack()
}

// MARK: - InteractivePopGestureInterface

extension UIViewController: InteractivePopGestureInterface {
    @objc public func isInteractivePopGestureEnabled() -> Bool {
        return true
    }
    
    @objc public func navigationControllerWillPopBack() {
        // Must be implemented for each ViewController that needs execute
        // something before the pop animation commits
    }
}
