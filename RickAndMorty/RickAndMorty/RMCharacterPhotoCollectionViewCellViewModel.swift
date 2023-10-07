//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/6/23.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    
    private let imagerUrl: URL?
    
    init(imageUrl: URL?) {
        self.imagerUrl = imageUrl
        
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void ) {
        guard let imagerUrl = imagerUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imagerUrl, completion: completion)
    }
}
