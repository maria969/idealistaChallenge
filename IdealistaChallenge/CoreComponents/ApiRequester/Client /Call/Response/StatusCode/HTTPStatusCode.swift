//
//  HTTPStatusCode.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

public enum HTTPStatusCode: Int {
    
    public enum ResponseType {
        case informational
        case success
        case redirection
        case clientError
        case serverError
        case undefined
    }
    
    // MARK: - Informational
    
    case `continue` = 100
    case switchingProtocols = 101
    case processing = 102
    
    // MARK: - Success
    
    case ok = 200
    case created = 201
    case accepted = 202
    case nonAuthoritativeInformation = 203
    case noContent = 204
    case resetContent = 205
    case partialContent = 206
    case multiStatus = 207
    case alreadyReported = 208
    case IMUsed = 226
    
    // MARK: - Redirection
    
    case multipleChoices = 300
    case movedPermanently = 301
    case found = 302
    case seeOther = 303
    case notModified = 304
    case useProxy = 305
    case switchProxy = 306
    case temporaryRedirect = 307
    case permenantRedirect = 308
    
    // MARK: - Client Error
    
    case badRequest = 400
    case unauthorized = 401
    case paymentRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case notAcceptable = 406
    case proxyAuthenticationRequired = 407
    case requestTimeout = 408
    case conflict = 409
    case gone = 410
    case lengthRequired = 411
    case preconditionFailed = 412
    case payloadTooLarge = 413
    case URITooLong = 414
    case unsupportedMediaType = 415
    case rangeNotSatisfiable = 416
    case expectationFailed = 417
    case teapot = 418
    case misdirectedRequest = 421
    case unprocessableEntity = 422
    case locked = 423
    case failedDependency = 424
    case upgradeRequired = 426
    case preconditionRequired = 428
    case tooManyRequests = 429
    case requestHeaderFieldsTooLarge = 431
    case noResponse = 444
    case unavailableForLegalReasons = 451
    case SSLCertificateError = 495
    case SSLCertificateRequired = 496
    case HTTPRequestSentToHTTPSPort = 497
    case clientClosedRequest = 499
    
    // MARK: - Server Error
    
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case HTTPVersionNotSupported = 505
    case variantAlsoNegotiates = 506
    case insufficientStorage = 507
    case loopDetected = 508
    case notExtended = 510
    case networkAuthenticationRequired = 511
    
    // MARK: - Other
    
    case cancelled = -999
    case timeOut = -1001
    case noConnection = -1009
    
    case undefined = -1
    
    // MARK: - Public Properties
    
    public var responseType: ResponseType {
        switch self.rawValue {
        case 100..<200:
            return ResponseType.informational
        case 200..<300:
            return ResponseType.success
        case 300..<400:
            return ResponseType.redirection
        case 400..<500:
            return ResponseType.clientError
        case 500..<600:
            return ResponseType.serverError
        default:
            return ResponseType.undefined
        }
    }
    
    // MARK: - Initializers
    
    public init(statusCode: Int) {
        self = HTTPStatusCode(rawValue: statusCode) ?? HTTPStatusCode.undefined
    }
}

// MARK: - HTTPURLResponse

public extension HTTPURLResponse {
    
    // MARK: - Public Properties
    
    var status: HTTPStatusCode {
        return HTTPStatusCode(statusCode: self.statusCode)
    }
}
