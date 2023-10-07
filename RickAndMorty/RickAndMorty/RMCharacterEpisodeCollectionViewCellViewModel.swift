//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/6/23.
//

import Foundation


final class RMCharacterEpisodeCollectionViewCellViewModel {
    let episodeDataUrl: URL?
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}
