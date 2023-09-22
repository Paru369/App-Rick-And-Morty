//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/21/23.
//

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMCharacter]
}
