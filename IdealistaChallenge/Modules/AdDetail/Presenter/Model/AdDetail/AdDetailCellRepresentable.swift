//
//  AdDetailCellRepresentable.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 15/5/25.
//

import Foundation
import UIKit

public protocol AdDetailCellRepresentable: CellRepresentable {
    var comment: String { get }
    var multimedia: [ImageEntity] { get }
    var operation: String { get }
    var priceInfo: PriceEntity { get }
    var roomNumber: Int { get }
    var bathNumber: Int { get }
    var constructedArea: Int { get }
    var floor: String { get }
    var flatLocation: String { get }
}
