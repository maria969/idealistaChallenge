//
//  AdDetailUiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation
import UIKit

public class AdDetailUiModel: AdDetailCellRepresentable {
    
    // MARK: - Public Properties
    
    public var comment: String
    public var multimedia: [ImageEntity]
    public var operation: String
    public var priceInfo: PriceEntity
    public var roomNumber: Int
    public var bathNumber: Int
    public var constructedArea: Int
    public var floor: String
    public var flatLocation: String
    public var latitude: Double
    public var longitude: Double
        
    public var cellType: UITableViewCell.Type {
        AdDetailTableViewCell.self
    }
    
    // MARK: - Initializers
    
    public init(comment: String,
                multimedia: [ImageEntity],
                operation: String,
                priceInfo: PriceEntity,
                roomNumber: Int,
                bathNumber: Int,
                constructedArea: Int,
                floor: String,
                flatLocation: String,
                latitude: Double,
                longitude: Double) {
        self.comment = comment
        self.multimedia = multimedia
        self.operation = operation
        self.priceInfo = priceInfo
        self.roomNumber = roomNumber
        self.bathNumber = bathNumber
        self.constructedArea = constructedArea
        self.floor = floor
        self.flatLocation = flatLocation
        self.latitude = latitude
        self.longitude = longitude
    }

    
    // MARK: - Public Methods
    
    public func createCell(_ tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(AdDetailTableViewCell.self, for: indexPath)
        cell.configureCell(with: self)
        return cell
    }
    
}
