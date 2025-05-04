//
//  PropertyStoring.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 3/5/25.
//

import Foundation

public protocol PropertyStoring: AnyObject {
    func getAssociatedObject<T>(_ key: UnsafeRawPointer) -> T?
    
    func setAssociatedObject<T>(_ object: T,
                                for key: UnsafeRawPointer,
                                policy: PropertyStoringAssociationPolicy)
}

extension PropertyStoring {
    public func getAssociatedObject<T>(_ key: UnsafeRawPointer) -> T? {
        return objc_getAssociatedObject(self, key) as? T
    }
    
    public func setAssociatedObject<T>(_ object: T,
                                       for key: UnsafeRawPointer,
                                       policy: PropertyStoringAssociationPolicy) {
        objc_setAssociatedObject(self, key, object, policy.objcPolicy)
    }
}

public enum PropertyStoringAssociationPolicy {
    case strong
    case copy
    case weak
    
    // MARK: - Public Properties
    
    public var objcPolicy: objc_AssociationPolicy {
        switch self {
        case .strong:
            return .OBJC_ASSOCIATION_RETAIN_NONATOMIC
        case .copy:
            return .OBJC_ASSOCIATION_COPY_NONATOMIC
        case .weak:
            return .OBJC_ASSOCIATION_ASSIGN
        }
    }
}
