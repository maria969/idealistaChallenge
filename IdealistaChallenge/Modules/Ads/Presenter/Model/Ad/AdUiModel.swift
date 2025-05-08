//
//  AdUiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 9/5/25.
//

import Foundation
import UIKit

public class AdUiModel: AdCellRepresentable {
    
    // MARK: - Public Properties
    
    public var address: String
    public var imageURL: URL?
    public var propertyType: String
    public var operation: String
    public var operationColor: UIColor?
    public var description: String
    public var priceInfo: PriceEntity
    
    public var onSelection: (() -> Void)?
    
    public var cellType: UITableViewCell.Type {
        AdTableViewCell.self
    }
    
    // MARK: - Initializers
    
    public init(address: String,
                imageURL: URL?,
                propertyType: String,
                operation: String,
                operationColor: UIColor?,
                description: String,
                priceInfo: PriceEntity) {
        self.address = address
        self.imageURL = imageURL
        self.propertyType = propertyType
        self.operation = operation
        self.operationColor = operationColor
        self.description = description
        self.priceInfo = priceInfo
    }

    
    // MARK: - Public Methods
    
    public func createCell(_ tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(AdTableViewCell.self, for: indexPath)
        cell.configureCell(with: self)
        return cell
    }
    
}
