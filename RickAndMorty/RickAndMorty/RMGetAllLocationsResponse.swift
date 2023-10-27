//
//  RMGetAllLocationsResponse.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/27/23.
//

import Foundation

struct RMGetAllLocationsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMLocation]
}
