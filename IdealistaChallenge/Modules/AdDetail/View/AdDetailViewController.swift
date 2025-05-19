//
//  AdDetailViewController.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 14/5/25.
//

import Foundation
import UIKit

public class AdDetailViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public private(set) lazy var loading: LoadingIndicator = LoadingView.default
    
    // MARK: - Private Properties
    
    private let presenter: AdDetailPresenterInterface
    
    private lazy var tableView: ModuleTableView = {
        let tableView = ModuleTableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initializers
    
    public required init(presenter: AdDetailPresenterInterface) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.assignView(self)
    }
    
    @available(*, unavailable, message: "This method is unavailable. Use init(presenter: AdDetailPresenterInterface) instead.")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("This method is unavailable. Use init(presenter: AdDetailPresenterInterface) instead.")
    }
    
    @available(*, unavailable, message: "This method is unavailable. Use init(presenter: AdDetailPresenterInterface) instead.")
    public required init?(coder: NSCoder) {
        fatalError("This method is unavailable. Use init(presenter: AdDetailPresenterInterface) instead.")
    }
    
    // MARK: - Life Cycle
    
    public override func loadView() {
        super.loadView()
        layoutSubviews()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    // MARK: - Layout
    
    private func layoutSubviews() {
        title = String(localized: "Detail")
        view.backgroundColor = .clear
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.top(withView: view, toSafeArea: true)
        tableView.bottom(withView: view)
        tableView.leading(withView: view)
        tableView.trailing(withView: view)
    }
    
    
}

// MARK: - AdDetailViewControllerInterface

extension AdDetailViewController: AdDetailViewControllerInterface {
    public func showAdDetail(_ modules: [any CellRepresentable]) {
        tableView.configure(with: modules)
    }
    
}
