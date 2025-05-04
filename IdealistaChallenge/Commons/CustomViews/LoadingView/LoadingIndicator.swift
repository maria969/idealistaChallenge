//
//  LoadingIndicator.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public protocol LoadingIndicator: AnyObject {
    static var `default`: LoadingIndicator { get }
    
    func start()
    func stop()
    func start(withView view: UIViewController)
    func stop(withView view: UIViewController)
}
