//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/30/23.
//

import Foundation


final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
        
    }
    
    public var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
    public func fetchCharacterData() {
        print(character.url)
        guard let url = requestUrl,
              let request = RMRequest(url: url) else {
            print("Failed to create")
            return
        }
        print(request.url)
    }
}
