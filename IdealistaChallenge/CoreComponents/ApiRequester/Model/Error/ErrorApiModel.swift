//
//  ErrorApiModel.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public class ErrorApiModel: Decodable {
    
    public enum Code {
        case server(HTTPStatusCode)
        case other
    }
    
    // MARK: - Public Properties
    
    public var code: ErrorApiModel.Code = ErrorApiModel.Code.other
    public let message: String
    
    public static var `default`: ErrorApiModel {
        return ErrorApiModel(code: ErrorApiModel.Code.other,
                             message: "idealistachallenge.error.server.general") //TODO: - Localized String
    }
    
    public static var noConnection: ErrorApiModel {
        return ErrorApiModel(code: ErrorApiModel.Code.server(HTTPStatusCode.noConnection),
                             message: "idealistachallenge.error.server.no_connection")
    }
    
    enum CodingKeys: String, CodingKey {
        case message = "error"
    }
    
    // MARK: - Initializers
    
    public init(code: ErrorApiModel.Code, message: String) {
        self.code = code
        self.message = message
    }
    
    public init(code: HTTPStatusCode, data: Data?) {
        let error: ErrorApiModel = APIDecoder.decode(ErrorApiModel.self, fromData: data) ?? .default
        self.code = ErrorApiModel.Code.server(code)
        self.message = error.message
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try values.decodeIfPresent(String.self, forKey: .message) ?? "idealistachallenge.error.server.general" //TODO: - Localized String
    }
    
    // MARK: - Public Methods
    
    public class func defaultError(for statusCode: HTTPStatusCode) -> ErrorApiModel {
        return ErrorApiModel(code: ErrorApiModel.Code.server(statusCode),
                             message: "idealistachallenge.error.server.general")  //TODO: - Localized String
    }
}
