//
//  APIPath.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public enum Path: String {
    case list = "list.json"
    case detail = "detail.json"
}


public class ApiPath {
    let baseUrl: String = "https://idealista.github.io/ios-challenge/"
    
    public func getURL(path: Path) -> URL {
        let urlString = "\(baseUrl)\(path.rawValue)"
        return URL(string: urlString)!
    }
}
