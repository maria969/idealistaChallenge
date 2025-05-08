//
//  ApiDecoder.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//

import Foundation

class APIDecoder {
    
    public typealias ModelResponse<T: Decodable> = (_ model: T) -> Void
    
    public class func decode<T: Decodable>(_ type: T.Type,
                                           fromData data: Data?) -> T? {
        guard let dataToDecode: Data = data else { return nil }
        do {
            let model = try dataToDecode.decode(type)
            return model
        } catch {
            return nil
        }
    }
}

// MARK: - Data

private extension Data {
    
    func simpleDecode<T: Decodable>(_ type: T.Type) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(type, from: self)
    }
    
    func decode<T: Decodable>(_ type: T.Type) throws -> T {
        do {
            return try simpleDecode(type)
        } catch DecodingError.dataCorrupted(let context) {
            guard let value = fragmentDecode(type) else { throw DecodingError.dataCorrupted(context) }
            return value
        } catch {
            throw error
        }
    }
    
    // MARK: - Private Methods
    
    private func fragmentDecode<T: Decodable>(_ type: T.Type) -> T? {
        do {
            let object = try JSONSerialization.jsonObject(with: self,
                                                          options: JSONSerialization.ReadingOptions.allowFragments)
            guard let value = object as? T else { return nil }
            return value
        } catch {
            return nil
        }
    }
}
