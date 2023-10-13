//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/10/23.
//

import UIKit

class RMEpisodeDetailViewViewModel {
    
    private let endpointUrl: URL?
    
    
    // MARK: -Init
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }
    
    
    // Fetch backing episode model
    
    private func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            return
        }
        
        RMService.shared.execute(request,
                                 expecting: RMEpisode.self) { [weak self] result in
            
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case .failure(let failure):
                print(String(describing: failure))
                break
            }
        }
    }

    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let characterUrls: [URL] = episode.characters.compactMap({
            return URL(string: $0)
        })
        let request: [RMRequest] = characterUrls.compactMap({
            return RMRequest(url: $0)
        })
        
        // 10 of parallel requests
        //Notifiedonce all done
        
        let group = DispatchGroup()
        '
    }
}
