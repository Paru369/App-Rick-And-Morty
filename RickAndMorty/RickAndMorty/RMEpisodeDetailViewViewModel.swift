//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/10/23.
//

import UIKit

class RMEpisodeDetailViewViewModel {
    
    private let endpointUrl: URL?
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }

    private func fetchEpisodeData() {
        
    }
}
