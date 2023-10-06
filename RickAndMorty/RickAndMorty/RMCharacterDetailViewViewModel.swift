//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/30/23.
//

import Foundation


final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    enum SectionType: CaseIterable {
           case photo

           case information

           case episodes
       }
    
    public var sections = SectionType.allCases
    
    // MARK: - Init 
    init(character: RMCharacter) {
        self.character = character
        
    }
    
    public var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
    
}
