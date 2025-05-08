//
//  AdsViewController.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public class AdsViewController: UIViewController {
    
    //MARK: - Public Properties
    
    public private(set) lazy var loading: LoadingIndicator = LoadingView.default
    
    //MARK: - Private Properties
    
    private let presenter: AdsPresenterInterface
    
    private lazy var tableView: ModuleTableView = {
        let tableView = ModuleTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initializers
    
    public required init(presenter: AdsPresenterInterface) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.assignView(self)
    }
    
    @available(*, unavailable, message: "This method is unavailable. Use init(presenter: AdsPresenterInterface) instead.")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("This method is unavailable. Use init(presenter: AdsPresenterInterface) instead.")
    }
    
    @available(*, unavailable, message: "This method is unavailable. Use init(presenter: AdsPresenterInterface) instead.")
    public required init?(coder: NSCoder) {
        fatalError("This method is unavailable. Use init(presenter: AdsPresenterInterface) instead.")
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
        title = "Ads" //TODO: - Add Localized
        view.backgroundColor = .white
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.top(withView: view, toSafeArea: true)
        tableView.leading(withView: view)
        tableView.trailing(withView: view)
        tableView.bottom(withView: view)
    }
    
}

// MARK: - AdsViewControllerInterface

extension AdsViewController: AdsViewControllerInterface {
    public func showListModules(_ modules: [CellRepresentable]) {
        tableView.configure(with: modules)
    }
    
    public func addListModules(_ modules: [CellRepresentable]) {
        tableView.addModules(with: modules)
    }
}
