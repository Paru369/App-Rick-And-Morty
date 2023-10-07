//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/6/23.
//

import Foundation


final class RMCharacterInfoCollectionViewCellViewModel {
    private let value: String
    private let title: String
    
    init(
        value: String,
        title: String) {
            self.value = value
            self.title = title
        }
}
