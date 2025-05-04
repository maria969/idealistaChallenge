//
//  UIView+Extensions.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation
import UIKit

public extension UIView {
    
    private enum YAnchorEnumType: Int {
        case top
        case bottom
        
        func layoutAttribute() -> NSLayoutConstraint.Attribute {
            switch self {
            case .top:
                return .top
            case .bottom:
                return .bottom
            }
        }
        
        func anchor(for view: UIView) -> NSLayoutYAxisAnchor {
            switch self {
            case .top:
                return view.topAnchor
            case .bottom:
                return view.bottomAnchor
            }
        }
        
        func anchor(for guide: UILayoutGuide) -> NSLayoutYAxisAnchor {
            switch self {
            case .top:
                return guide.topAnchor
            case .bottom:
                return guide.bottomAnchor
            }
        }
    }
    
    private enum XAnchorEnumType: Int {
        case leading
        case trailing
        
        func layoutAttribute() -> NSLayoutConstraint.Attribute {
            switch self {
            case .leading:
                return .leading
            case .trailing:
                return .trailing
            }
        }
        
        func anchor(for view: UIView) -> NSLayoutXAxisAnchor {
            switch self {
            case .leading:
                return view.leadingAnchor
            case .trailing:
                return view.trailingAnchor
            }
        }
        
        func anchor(for guide: UILayoutGuide) -> NSLayoutXAxisAnchor {
            switch self {
            case .leading:
                return guide.leadingAnchor
            case .trailing:
                return guide.trailingAnchor
            }
        }
    }
    
    // MARK: - Public Methods
    
    @discardableResult func top(withView view: UIView,
                                constant: CGFloat = 0.0,
                                relation: NSLayoutConstraint.Relation = .equal,
                                priority: Float = 1000,
                                toSafeArea safeArea: Bool = false) -> NSLayoutConstraint {
        guard safeArea else {
            return constraint(withItem: self,
                                   attribute: .top,
                                   toItem: view,
                                   relation: relation,
                                   constant: constant, priority: priority)
        }
        return constraint(toView: view,
                          withYAnchor: .top,
                          relation: relation,
                          constant: constant,
                          priority: priority)
    }
    
    @discardableResult func bottom(withView view: UIView,
                                   constant: CGFloat = 0.0,
                                   relation: NSLayoutConstraint.Relation = .equal,
                                   priority: Float = 1000,
                                   toSafeArea safeArea: Bool = false) -> NSLayoutConstraint {
        guard safeArea else {
            return constraint(withItem: self,
                              attribute: .bottom,
                              toItem: view,
                              relation: relation,
                              constant: constant,
                              priority: priority)
        }
        
        return constraint(toView: view,
                          withYAnchor: .bottom,
                          relation: relation,
                          constant: constant,
                          priority: priority)
    }
    
    @discardableResult func leading(withView view: UIView,
                                    constant: CGFloat = 0.0,
                                    relation: NSLayoutConstraint.Relation = .equal,
                                    priority: Float = 1000,
                                    toSafeArea safeArea: Bool = false) -> NSLayoutConstraint {
        guard safeArea else {
            return constraint(withItem: self,
                              attribute: .leading,
                              toItem: view,
                              relation: relation,
                              constant: constant,
                              priority: priority)
        }
        
        return constraint(toView: view,
                          withXAnchor: .leading,
                          relation: relation,
                          constant: constant,
                          priority: priority)
    }
    
    @discardableResult func trailing(withView view: UIView,
                                     constant: CGFloat = 0.0,
                                     relation: NSLayoutConstraint.Relation = .equal,
                                     priority: Float = 1000,
                                     toSafeArea safeArea: Bool = false) -> NSLayoutConstraint {
        guard safeArea else {
            return constraint(withItem: self,
                              attribute: .trailing,
                              toItem: view,
                              relation: relation,
                              constant: constant,
                              priority: priority)
        }
        
        return constraint(toView: view,
                          withXAnchor: .trailing,
                          relation: relation,
                          constant: constant,
                          priority: priority)
    }
    
    @discardableResult func width(constant: CGFloat = 0.0,
                                  multiplier: CGFloat = 1.0,
                                  relation: NSLayoutConstraint.Relation = .equal,
                                  priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .width,
                                            relatedBy: relation,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func height(constant: CGFloat = 0.0,
                                   multiplier: CGFloat = 1.0,
                                   relation: NSLayoutConstraint.Relation = .equal,
                                   priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .height,
                                            relatedBy: relation,
                                            toItem: nil,
                                            attribute: .notAnAttribute,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func aspectRatio(from attribute: NSLayoutConstraint.Attribute = .height,
                                        multiplier: CGFloat = 1.0,
                                        constant: CGFloat = 0.0,
                                        relation: NSLayoutConstraint.Relation = .equal,
                                        priority: Float = 1000) -> NSLayoutConstraint {
        
        let fromAttribute: NSLayoutConstraint.Attribute
        if (attribute != .height && attribute != .width) {
            fromAttribute = .height
        } else {
            fromAttribute = attribute
        }
        
        let toAttribute: NSLayoutConstraint.Attribute
        if attribute == .height {
            toAttribute = NSLayoutConstraint.Attribute.width
        } else {
            toAttribute = NSLayoutConstraint.Attribute.height
        }
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute:
                                                fromAttribute,
                                            relatedBy: relation,
                                            toItem: self,
                                            attribute: toAttribute,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func relationalHeight(toView view: UIView,
                                             fromView parent: UIView,
                                             multiplier: CGFloat = 1.0,
                                             constant: CGFloat = 0.0,
                                             relation: NSLayoutConstraint.Relation = .equal,
                                             priority: Float = 1000) -> NSLayoutConstraint {
        return relational(attribute: .height,
                          toAttribute: .height,
                          toView: view,
                          fromView: parent,
                          multiplier: multiplier,
                          constant: constant,
                          relation: relation,
                          priority: priority)
    }
    
    @discardableResult func relationalWidth(toView view: UIView,
                                            fromView parent: UIView,
                                            multiplier: CGFloat = 1.0,
                                            constant: CGFloat = 0.0,
                                            relation: NSLayoutConstraint.Relation = .equal,
                                            priority: Float = 1000) -> NSLayoutConstraint {
        return relational(attribute: .width,
                          toAttribute: .width,
                          toView: view,
                          fromView: parent,
                          multiplier: multiplier,
                          constant: constant,
                          relation: relation,
                          priority: priority)
    }
    
    @discardableResult func relational(attribute: NSLayoutConstraint.Attribute,
                                       toAttribute otherAttribute: NSLayoutConstraint.Attribute,
                                       toView view: UIView,
                                       fromView parent: UIView,
                                       multiplier: CGFloat = 1.0,
                                       constant: CGFloat = 0.0,
                                       relation: NSLayoutConstraint.Relation = .equal,
                                       priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: attribute,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: otherAttribute,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func centerX(withView view: UIView,
                                    fromView parent: UIView? = nil,
                                    multiplier: CGFloat = 1.0,
                                    constant: CGFloat = 0.0,
                                    relation: NSLayoutConstraint.Relation = .equal,
                                    priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .centerX,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .centerX,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        if let parentView: UIView = parent {
            parentView.addConstraint(constraint)
        } else {
            view.addConstraint(constraint)
        }
        
        return constraint
    }
    
    @discardableResult func centerY(withView view: UIView,
                                    fromView parent: UIView? = nil,
                                    multiplier: CGFloat = 1.0,
                                    constant: CGFloat = 0.0,
                                    relation: NSLayoutConstraint.Relation = .equal,
                                    priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .centerY,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .centerY,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        if let parentView: UIView = parent {
            parentView.addConstraint(constraint)
        } else {
            view.addConstraint(constraint)
        }
        
        return constraint
    }
    
    @discardableResult func top(toBottom view: UIView,
                                fromView parent: UIView,
                                multiplier: CGFloat = 1.0,
                                constant: CGFloat = 0.0,
                                relation: NSLayoutConstraint.Relation = .equal,
                                priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .top,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .bottom,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func bottom(toTop view: UIView,
                                   fromView parent: UIView,
                                   multiplier: CGFloat = 1.0,
                                   constant: CGFloat = 0.0,
                                   relation: NSLayoutConstraint.Relation = .equal,
                                   priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .bottom,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .top,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func left(toRight view: UIView,
                                 fromView parent: UIView,
                                 multiplier: CGFloat = 1.0,
                                 constant: CGFloat = 0.0,
                                 relation: NSLayoutConstraint.Relation = .equal,
                                 priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .left,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .right,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func right(toLeft view: UIView,
                                  fromView parent: UIView,
                                  multiplier: CGFloat = 1.0,
                                  constant: CGFloat = 0.0,
                                  relation: NSLayoutConstraint.Relation = .equal,
                                  priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .right,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .left,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func top(toView view: UIView,
                                fromView parent: UIView,
                                multiplier: CGFloat = 1.0,
                                constant: CGFloat = 0.0,
                                relation: NSLayoutConstraint.Relation = .equal,
                                priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .top,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .top,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func bottom(toView view: UIView,
                                   fromView parent: UIView,
                                   multiplier: CGFloat = 1.0,
                                   constant: CGFloat = 0.0,
                                   relation: NSLayoutConstraint.Relation = .equal,
                                   priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .bottom,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .bottom,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func leading(toView view: UIView,
                                    fromView parent: UIView,
                                    multiplier: CGFloat = 1.0,
                                    constant: CGFloat = 0.0,
                                    relation: NSLayoutConstraint.Relation = .equal,
                                    priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .leading,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .leading,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    @discardableResult func trailing(toView view: UIView,
                                     fromView parent: UIView,
                                     multiplier: CGFloat = 1.0,
                                     constant: CGFloat = 0.0,
                                     relation: NSLayoutConstraint.Relation = .equal,
                                     priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .trailing,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: .trailing,
                                            multiplier: multiplier,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        parent.addConstraint(constraint)
        
        return constraint
    }
    
    // MARK: - Private Methods
    
    private func constraint(withItem item: UIView,
                            attribute: NSLayoutConstraint.Attribute,
                            toItem otherItem: UIView,
                            relation: NSLayoutConstraint.Relation,
                            constant: CGFloat,
                            priority: Float = 1000) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: item,
                                            attribute: attribute,
                                            relatedBy: relation,
                                            toItem: otherItem,
                                            attribute: attribute,
                                            multiplier: 1.0,
                                            constant: constant)
        constraint.priority = UILayoutPriority(priority)
        otherItem.addConstraint(constraint)
        
        return constraint
    }
    
    private func constraint(toView view: UIView,
                            withXAnchor xAnchor: XAnchorEnumType,
                            relation: NSLayoutConstraint.Relation,
                            constant: CGFloat,
                            priority: Float = 1000) -> NSLayoutConstraint {
        return constraint(withGuide: view.safeAreaLayoutGuide,
                          xAnchor: xAnchor,
                          relation: relation,
                          constant: constant,
                          priority: priority)
    }
    
    private func constraint(toView view: UIView,
                            withYAnchor yAnchor: YAnchorEnumType,
                            relation: NSLayoutConstraint.Relation,
                            constant: CGFloat,
                            priority: Float = 1000) -> NSLayoutConstraint {
        return constraint(withGuide: view.safeAreaLayoutGuide,
                          yAnchor: yAnchor,
                          relation: relation,
                          constant: constant,
                          priority: priority)
    }
    
    private func constraint(withGuide guide: UILayoutGuide,
                            xAnchor: XAnchorEnumType,
                            relation: NSLayoutConstraint.Relation,
                            constant: CGFloat,
                            priority: Float = 1000) -> NSLayoutConstraint {
        let xAnchorLayout = xAnchor.anchor(for: self)
        let xAnchorGuideLayout = xAnchor.anchor(for: guide)
        let constraint = xAnchorLayout.constraint(to: xAnchorGuideLayout,
                                                  constant: constant,
                                                  relation: relation)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(priority)
        
        return constraint
    }
    
    private func constraint(withGuide guide: UILayoutGuide,
                            yAnchor: YAnchorEnumType,
                            relation: NSLayoutConstraint.Relation,
                            constant: CGFloat,
                            priority: Float = 1000) -> NSLayoutConstraint {
        let yAnchorLayout = yAnchor.anchor(for: self)
        let yAnchorGuideLayout = yAnchor.anchor(for: guide)
        let constraint = yAnchorLayout.constraint(to: yAnchorGuideLayout,
                                                  constant: constant,
                                                  relation: relation)
        constraint.isActive = true
        constraint.priority = UILayoutPriority(priority)
        
        return constraint
    }
}

// MARK: - NSLayoutXAxisAnchor

public extension NSLayoutXAxisAnchor {
    func constraint(to anchor: NSLayoutXAxisAnchor,
                    constant c: CGFloat,
                    relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: anchor, constant: c)
        case .greaterThanOrEqual:
            return constraint(greaterThanOrEqualTo: anchor, constant: c)
        case .lessThanOrEqual:
            return constraint(lessThanOrEqualTo: anchor, constant: c)
        default:
            return constraint(equalTo: anchor, constant: c)
        }
    }
}

// MARK: - NSLayoutYAxisAnchor

public extension NSLayoutYAxisAnchor {
    func constraint(to anchor: NSLayoutYAxisAnchor,
                    constant c: CGFloat,
                    relation: NSLayoutConstraint.Relation = .equal) -> NSLayoutConstraint {
        switch relation {
        case .equal:
            return constraint(equalTo: anchor, constant: c)
        case .greaterThanOrEqual:
            return constraint(greaterThanOrEqualTo: anchor, constant: c)
        case .lessThanOrEqual:
            return constraint(lessThanOrEqualTo: anchor, constant: c)
        default:
            return constraint(equalTo: anchor, constant: c)
        }
    }
}

// MARK: - PropertyStoring

extension UIView: PropertyStoring {}
