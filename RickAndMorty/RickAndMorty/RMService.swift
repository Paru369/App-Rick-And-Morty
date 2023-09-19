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
        
    }

}
