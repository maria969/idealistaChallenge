//
//  LoadingView.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public class LoadingView: UIView, LoadingIndicator {
    
    // MARK: - Public Properties
    
    public static var `default`: LoadingIndicator {
        let size = UIScreen.main.bounds
        let frame = CGRect(x: 0.0,
                           y: 0.0,
                           width: size.width,
                           height: size.height)
        
        return LoadingView(frame: frame)
    }
    
    // MARK: - Private Properties
    
    private var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView.init(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    // MARK: - Layout
    
    private func configureView() {
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        isHidden = true
        configureActivityIndicator()
    }
    
    private func configureActivityIndicator() {
        addSubview(activityIndicator)
        activityIndicator.centerX(withView: self)
        activityIndicator.centerY(withView: self)
    }
    
    // MARK: - Public Methods
    
    public func start() {
        guard addIndicator() else { return }
        startLoading()
    }
    
    public func stop() {
        stopLoading()
        removeIndicator()
    }
    
    public func start(withView view: UIViewController) {
        guard addIndicator(in: view) else { return }
        startLoading()
    }
    
    public func stop(withView view: UIViewController) {
        stopLoading()
        removeIndicator(in: view)
    }
    
    // MARK: - Private Methods
    
    private func addIndicator(in view: UIViewController? = nil) -> Bool {
        if let viewController: UIViewController = view {
            return add(to: viewController.view)
        } else {
            return add(to: UIWindow.main)
        }
    }
    
    private func removeIndicator(in view: UIViewController? = nil) {
        if let viewController: UIViewController = view {
            remove(in: viewController.view)
        } else {
            remove(in: UIWindow.main)
        }
    }
    
    private func add(to view: UIView?) -> Bool {
        guard let currentView: UIView = view else { return false }
        removeAllIndicators(from: currentView)
        currentView.addSubview(self)
        currentView.bringSubviewToFront(self)
        isHidden = false
        
        return true
    }
    
    private func remove(in view: UIView?) {
        isHidden = true
        guard let currentView: UIView = view else { return }
        currentView.sendSubviewToBack(self)
        removeFromSuperview()
    }
    
    private func startLoading() {
        activityIndicator.startAnimating()
    }
    
    private func stopLoading() {
        activityIndicator.stopAnimating()
    }
    
    private func removeAllIndicators(from view: UIView) {
        for subview in view.subviews {
            guard subview is LoadingView else { continue }
            view.sendSubviewToBack(subview)
            subview.removeFromSuperview()
        }
    }
}
