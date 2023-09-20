//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/17/23.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    // https://rickandmortyapi.com/api/character
    //    // Query paramters:
    //name: filter by the given name.
    //status: filter by the given status (alive, dead or unknown).
    //species: filter by the given species.
    //type: filter by the given type.
    //gender: filter by the given gender (female, male, genderless or unknown).
    
    
    /// API Constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
   private let endpoint: RMEndpoint
    
    ///path components for API
    private  let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the API request in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
        
        
    }
    
    /// Computed & constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    ///Desired method
    public let httpMethod = "GET"
    
    /// Construct request
    /// PARAMETERS:
    /// -- endpoint: Target endpoint
    /// -- pathComponentes: Collection or Path components
    /// -- queryParameters: Collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ){
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}


extension RMRequest {
    static let listCharactersRquest = RMRequest(endpoint: .character)
}
