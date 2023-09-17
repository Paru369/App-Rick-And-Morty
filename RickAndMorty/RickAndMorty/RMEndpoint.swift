//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/17/23.
//

import Foundation

/// Represent unique API Endpoint
@frozen enum RMEndpoint: String  {
    /// Endpoint to get info of character
    case character
    /// Endpoint to get info of location
    case location
    /// Endpoint to get info of episode
    case episode
    
}

