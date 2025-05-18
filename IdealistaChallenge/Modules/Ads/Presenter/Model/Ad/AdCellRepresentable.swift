//
//  AdCellRepresentable.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 9/5/25.
//

import Foundation
import UIKit

public protocol AdCellRepresentable: CellRepresentable, SelectableCellRepresentable {
    var address: String { get } 
    var imageURL: URL? { get }
    var propertyType: String { get }
    var operation: String { get }
    var operationColor: UIColor? { get }
    var description: String { get }
    var priceInfo: PriceEntity { get }
    var isFav: Bool { get }
    var favDate: String? { get }
    var onClickFavButton: (() -> Void)? { get }
}
