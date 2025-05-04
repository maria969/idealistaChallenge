//
//  CellRepresentable.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public protocol CellRepresentable {
    var cellType: UITableViewCell.Type { get }
    
    func createCell(_ tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
    func heightCell(_ tableView: UITableView) -> CGFloat
    func estimatedHeightCell(_ tableView: UITableView) -> CGFloat
}

extension CellRepresentable {
    public func heightCell(_ tableView: UITableView) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func estimatedHeightCell(_ tableView: UITableView) -> CGFloat {
        return 44.0
    }
}

// MARK: - Array Methods

extension Array where Element == CellRepresentable {
    
    // MARK: - Public Methods
    
    public func registerCells(_ tableView: UITableView) {
        let cellTypes: [UITableViewCell.Type] = reduce(into: []) { (result, cell) in
            guard !result.contains(where: { $0 == cell.cellType }) else { return }
            result.append(cell.cellType)
        }
        
        cellTypes.forEach { tableView.register($0) }
    }
}
