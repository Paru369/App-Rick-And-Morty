//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/17/23.
//

import Foundation


enum RMCharacterStatus: String, Codable {
    case alive  = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}
