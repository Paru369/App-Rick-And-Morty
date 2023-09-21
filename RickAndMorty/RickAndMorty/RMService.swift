//
//  RMservice.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/17/23.
//

import Foundation


/// Primary API service object to get Rick and Morty data
final class RMService {
    
    /// Shared sigleton instace
    static let shared = RMService()
    
    /// Privatized construtctor
    private init() {
        
    }
    
    enum RMServiceError: Error {
        case failedToRequest
    }
    /// Send Rick and Morty API Call
    ///  - Parameters:
    ///  -- request: Request instance
    ///  -- type: The tyoe of object we expect to get back
    ///  -- completion: Callback with data or error
    public func execute<T: Codable>(
           _ request: RMRequest,
           expecting type: T.Type,
           completion: @escaping (Result<T, Error>) -> Void
       ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToRequest))
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToRequest))
                print("++++")
                return
            }
            
            /// Decode reponse
            do {
                
                let result = try JSONDecoder().decode(type.self, from: data)
                print("++++ \(result)")
                completion(.success(result))
                 
            }
            catch {
                print("++++ \(error)")
                completion(.failure(error))
            }
            
        }
        
        task.resume()
    }
    
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        //print(request)
        return request
    }

}
