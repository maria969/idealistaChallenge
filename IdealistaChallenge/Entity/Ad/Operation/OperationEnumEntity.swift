//
//  OperationEnumEntity.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation
import UIKit

public enum OperationEnumEntity {
    case sale
    case rent
    
    public var localizedString: String {
        switch self {
        case .sale: "Venta"
        case .rent: "Alquiler" //TODO: - Localized Strings
        }
    }
    
    public var operationColor: UIColor {
        switch self {
        case .sale: .cyan
        case .rent: .yellow
        }
    }
}
