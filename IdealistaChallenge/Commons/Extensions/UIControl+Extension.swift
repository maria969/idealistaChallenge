//
//  UIControl+Extension.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 17/5/25.
//

import Foundation
import UIKit

extension UIControl {
    
    private struct ExtendedProperties {
        public static var kEventAction: Int = 0
    }
    
    // MARK: - Public Properties
    
    public var onTouch: ((UIControl) -> Void)? {
        get {
            return action(forEvent: .touchUpInside)
        }
        set {
            addAction(forEvent: .touchUpInside,
                      action: newValue)
        }
    }
    
    // MARK: - Private Properties
    
    private var targetActions: [UIControlEventAction]? {
        get {
            return getAssociatedObject(&ExtendedProperties.kEventAction)
        }
        set {
            setAssociatedObject(newValue,
                                for: &ExtendedProperties.kEventAction,
                                policy: .strong)
        }
    }
    
    // MARK: - Public Methods
    
    public func action(forEvent event: UIControl.Event) -> ((UIControl) -> Void)? {
        return targetActions?.action(forEvent: event)?.action
    }
    
    public func addAction(forEvent event: UIControl.Event,
                          action: ((UIControl) -> Void)?) {
        removeActions(forEvent: event)
        
        let action = UIControlEventAction(target: self,
                                          event: event,
                                          action: action)
        
        var actions: [UIControlEventAction]
        if let targetActions = targetActions {
            actions = targetActions
        } else {
            actions = []
        }
        
        actions.append(action)
        targetActions = actions
    }
    
    public func removeActions(forEvent event: UIControl.Event) {
        let actions = targetActions?.removeElements(forEvent: event)
        targetActions = actions
    }
}

private class UIControlEventAction {
    
    public typealias Action<K> = (_ view: K?) -> Void
    
    // MARK: - Public Properties
    
    public weak var target: UIControl?
    public let event: UIControl.Event
    public var action: ((UIControl) -> Void)?
    
    // MARK: - Initializers
    
    public init(target: UIControl,
                event: UIControl.Event,
                action: ((UIControl) -> Void)?) {
        self.target = target
        self.event = event
        self.action = action
        
        target.addTarget(self,
                         action: #selector(executeAction),
                         for: event)
    }
    
    // MARK: - Events
    
    @objc private func executeAction() {
        guard let target = self.target else { return }
        action?(target)
    }
}

// MARK: - Array Methods

private extension Array where Element: UIControlEventAction {
    
    // MARK: - Public Methods
    
    func action(forEvent event: UIControl.Event) -> Element? {
        return first { $0.event == event }
    }
    
    func removeElements(forEvent event: UIControl.Event) -> Self {
        return filter { $0.event != event }
    }
}
