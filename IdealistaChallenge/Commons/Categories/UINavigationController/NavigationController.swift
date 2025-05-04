//
//  NavigationController.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public class NavigationController: UINavigationController {
    
    public typealias Completion = () -> Void
    
    // MARK: - Private Properties
    
    private var isPushAnimation: Bool = false
    private var isPopping: Bool = false
    private weak var interactivePopDelegate: InteractivePopGestureInterface?
    
    // MARK: - Initializers
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.delegate = self
        self.modalPresentationStyle = .fullScreen
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.delegate = self
        self.modalPresentationStyle = .fullScreen
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.modalPresentationStyle = .fullScreen
    }
    
    public required convenience init?(viewControllersRepresentable: [ViewControllerRepresentable]) {
        let viewControllers: [UIViewController] = viewControllersRepresentable.map { $0.viewController }
        self.init(viewControllers: viewControllers)
    }
    
    public required init?(viewControllers: [UIViewController]) {
        let rootViewController: UIViewController = viewControllers[0]
        let otherViewControllers: [UIViewController] = Array(viewControllers.dropFirst())
        super.init(rootViewController: rootViewController)
        self.viewControllers.append(contentsOf: otherViewControllers)
        self.delegate = self
        self.modalPresentationStyle = .fullScreen
        self.interactivePopDelegate = viewControllers.last
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    deinit {
        self.delegate = nil
        self.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // MARK: - Public Methods
    
    public override func pushViewController(_ viewController: UIViewController,
                                            animated: Bool) {
        self.isPushAnimation = true
        self.interactivePopDelegate = viewController
        super.pushViewController(viewController,
                                 animated: animated)
    }
    
    @discardableResult public override func popViewController(animated: Bool) -> UIViewController? {
        isPopping = true
        return super.popViewController(animated: animated)
    }
    
    @discardableResult public override func popToViewController(_ viewController: UIViewController,
                                                                animated: Bool) -> [UIViewController]? {
        interactivePopDelegate = viewController
        return super.popToViewController(viewController,
                                         animated: animated)
    }
    
    public func setViewControllers(_ viewControllers: [UIViewController],
                                   animated: Bool,
                                   completion: @escaping NavigationController.Completion) {
        super.setViewControllers(viewControllers, animated: animated)
        
        if animated,
           let coordinator: UIViewControllerTransitionCoordinator = transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { (_) in
                completion()
            }
        } else {
            DispatchQueue.main.async { completion() }
        }
    }
    
    // MARK: - Private Methods
    
    private func interactivePopViewController(_ navigationController: NavigationController,
                                              viewController: UIViewController?) {
        guard interactivePopGestureRecognizer?.state == UIGestureRecognizer.State.began else {
            isPopping = false
            interactivePopDelegate?.navigationControllerWillPopBack()
            interactivePopDelegate = viewController
            return
        }
        
        let coordinator: UIViewControllerTransitionCoordinator? = viewController?.transitionCoordinator
        coordinator?.notifyWhenInteractionChanges { [weak navigationController, viewController] (context) in
            if context.isCancelled {
                navigationController?.isPopping = false
            } else {
                navigationController?.isPopping = false
                navigationController?.interactivePopDelegate?.navigationControllerWillPopBack()
                navigationController?.interactivePopDelegate = viewController
            }
        }
    }
}

// MARK: - UINavigationControllerDelegate

extension NavigationController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController,
                                     didShow viewController: UIViewController,
                                     animated: Bool) {
        guard let currentNavigationController = navigationController as? NavigationController else { return }
        currentNavigationController.isPushAnimation = false
    }
    
    public func navigationController(_ navigationController: UINavigationController,
                                     willShow viewController: UIViewController,
                                     animated: Bool) {
        guard let currentNavigationController = navigationController as? NavigationController,
            currentNavigationController.isPopping else { return }
        self.interactivePopViewController(currentNavigationController,
                                          viewController: currentNavigationController.topViewController)
    }
}

// MARK: - UIGestureRecognizerDelegate

extension NavigationController: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer else { return true }
        let allowedPopGesture = viewControllers.count > 1 && !isPushAnimation
        
        if allowedPopGesture {
            return interactivePopDelegate?.isInteractivePopGestureEnabled() ?? false
        } else {
            return false
        }
    }
}
