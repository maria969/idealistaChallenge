//
//  UITableView+Extension.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

extension UITableView {
    
    // MARK: - Public Methods
    
    public func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
    }
    
    public func registerHeaderFooter<T: UITableViewHeaderFooterView>(_ headerFooterClass: T.Type) {
        register(headerFooterClass, forHeaderFooterViewReuseIdentifier: String(describing: headerFooterClass))
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        let reuseIdentifier: String = String(describing: cellClass)
        guard let cell: T = dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? T else {
            let errorString: String = String(format: "Unable to dequeue %@ with reuseId of %@", String(describing: cellClass), reuseIdentifier)
            fatalError(errorString)
        }
        
        return cell
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ headerFooterClass: T.Type) -> T {
        let reuseIdentifier: String = String(describing: headerFooterClass)
        guard let headerFooterView: T = dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T else {
            let errorString: String = String(format: "Unable to dequeue %@ with reuseId of %@", String(describing: headerFooterClass), reuseIdentifier)
            fatalError(errorString)
        }
        
        return headerFooterView
    }
}
