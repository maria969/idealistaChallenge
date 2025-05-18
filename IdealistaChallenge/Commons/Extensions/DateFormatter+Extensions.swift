//
//  DateFormatter+Extensions.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 18/5/25.
//

import Foundation

extension DateFormatter {
    
    // MARK: - Public Properties
    
    public static let iso8601DateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return formatter
    }()
    
    public static let favDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.locale = .current
        
        return formatter
    }()
}
