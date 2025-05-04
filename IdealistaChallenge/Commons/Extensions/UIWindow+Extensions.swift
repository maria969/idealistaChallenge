//
//  UIWindow+Extensions.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public extension UIWindow {
    
    // MARK: - Public Properties
    
    static var main: UIWindow? {
        return UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}
