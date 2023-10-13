//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/10/23.
//

import UIKit

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

class RMEpisodeDetailViewViewModel {
    
    private let endpointUrl: URL?
    
    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }
    

    enum SectionType {
        case information(viewModels: [RMEpisodeInfoCollectionViewCellViewModel ])
        case characters(viewModel: [RMCharacterCollectionViewCell])
    }
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    
    public private(set) var sections: [SectionType] = []
    // MARK: - Init
    
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
      
    }
    
    // MARK: - Public
    
    //MARK: - Private
    
    
    // Fetch backing episode model
    
    public func fetchEpisodeData() {
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
        let requests: [RMRequest] = characterUrls.compactMap({
            return RMRequest(url: $0)
        })
        
        // 10 of parallel requests
        //Notifiedonce all done
        
        let group = DispatchGroup()
        
        var characters: [RMCharacter] = []
        
        for request in requests {
            group.enter()
            RMService.shared.execute(request, expecting: RMCharacter.self) {
                result in
                defer {
                    group.leave()
                }
                switch result {
                case . success(let model):
                    characters.append(model)
                case .failure:
                    break
                    
                }
            }
        }
        
        group.notify(queue: .main) {
            self.dataTuple = (
                episode: episode,
                characters: characters
            )
        }
    }
}
