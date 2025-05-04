//
//  Queueable.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 4/5/25.
//

import Foundation

public protocol Queueable {
    var workingQueue: DispatchQueue { get }
}
