//
//  RMGetAllEpisodesResponse.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/11/23.
//

struct RMGetAllEpisodesResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }

    let info: Info
    let results: [RMEpisode]
}
