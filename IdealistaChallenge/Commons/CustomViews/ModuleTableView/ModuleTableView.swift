//
//  ModuleTableView.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public class ModuleTableView: UIView {
    
    // MARK: - Public Properties
    
    public var contentInset: UIEdgeInsets {
        get { return tableView.contentInset }
        set { tableView.contentInset = newValue }
    }
    
    public private(set) var items: [CellRepresentable] = []
    
    // MARK: - Private Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        return tableView
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
        configureTableView()
    }
    
    private func configureTableView() {
        addSubview(tableView)
        tableView.top(withView: self)
        tableView.bottom(withView: self)
        tableView.leading(withView: self)
        tableView.trailing(withView: self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Public Methods
    
    public func configure(with items: [CellRepresentable]) {
        items.registerCells(tableView)
        
        self.items = items
        tableView.reloadData()
    }
    
    public func addModules(with items: [CellRepresentable]) {
        items.registerCells(tableView)
        
        self.items.removeAll(where: { $0 is LoadingCellRepresentable })
        self.items.append(contentsOf: items)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ModuleTableView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        return item.createCell(tableView, atIndexPath: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension ModuleTableView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = items[indexPath.row] as? SelectableCellRepresentable else { return }
        item.onSelection?()
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let item = items[indexPath.row] as? LoadingCellRepresentable else { return }
        item.willStartLoading()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.row]
        return item.heightCell(tableView)
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.row]
        return item.estimatedHeightCell(tableView)
    }
}
