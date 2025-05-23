//
//  ApiClient.swift
//  IdealistaChallenge
//
//  Created by Maria Herrero Varas on 8/5/25.
//
import Foundation

public final class ApiClient {
    
    public typealias Response<T> = (_ response: T) -> Void
    public typealias ResponseError = (_ error: ErrorApiModel) -> Void
    
    // MARK: - Public Properties
    
    public let environmentManager: EnvironmentManagerInterface
    public let clientQueue: DispatchQueue
    
    // MARK: - Initializers
    
    public required init(environment: EnvironmentManagerInterface,
                         queue: DispatchQueue) {
        self.environmentManager = environment
        self.clientQueue = queue
    }
    
    // MARK: - Public Methods

    public func request<T: Decodable>(_ endpoint: URL,
                                      success: @escaping ApiClient.Response<T>,
                                      failure: @escaping ApiClient.ResponseError) {
        
        let session = URLSession.shared
        let task = session.dataTask(with: endpoint) { data, response, error in
            
            if error != nil {
                failure(ErrorApiModel(code: .undefined, data: nil))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, let data = data else {
                failure(ErrorApiModel(code: .undefined, data: nil))
                return
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                do {
                    let decodedModel = try JSONDecoder().decode(T.self, from: data)
                    success(decodedModel)
                } catch let decodingError as DecodingError {
                    // Manejo específico de errores de decodificación
                    switch decodingError {
                    case .dataCorrupted(let context):
                        print("Error: El dato está corrupto. Contexto: \(context.debugDescription)")
                        print("Detalles: \(context.codingPath)")  // Muestra la ruta del campo con error
                    case .keyNotFound(let key, let context):
                        print("Error: La clave '\(key)' no se encontró. Contexto: \(context.debugDescription)")
                        print("Detalles: \(context.codingPath)")  // Muestra la ruta del campo con error
                    case .valueNotFound(let value, let context):
                        print("Error: El valor esperado para '\(value)' no fue encontrado. Contexto: \(context.debugDescription)")
                        print("Detalles: \(context.codingPath)")  // Muestra la ruta del campo con error
                    case .typeMismatch(let type, let context):
                        print("Error: Tipo incompatible. Esperado: \(type), pero se encontró otro tipo. Contexto: \(context.debugDescription)")
                        print("Detalles: \(context.codingPath)")  // Muestra la ruta del campo con error
                    @unknown default:
                        print("Error desconocido de decodificación: \(decodingError)")
                    }
                } catch {
                    failure(ErrorApiModel(code: .undefined, data: data))
                }
            } else {
                failure(ErrorApiModel(code: HTTPStatusCode(rawValue: httpResponse.statusCode) ?? .undefined,
                                      data: data))
            }
        }
        
        task.resume()
    }
}

