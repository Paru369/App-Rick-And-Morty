//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/6/23.
//

import Foundation


final class RMCharacterInfoCollectionViewCellViewModel {
    private let type: `Type`
    
    private let value: String
    
    
    public var title: String {
        self.type.displayTitle
    }
    
    public var displayValue: String {
       
        if value.isEmpty {return "none"}
        return value
    }
    
    
    
    enum `Type`{
        case status
        case gender
        case type
        case species
        case origin
        case created
        case location
        case episodeCount
        
        var displayTitle: String {
            switch self {
            case .status:
                return "Something"
            case .gender:
                return "Something"
            case .type:
                return "Something"
            case .species:
                return "Something"
            case .origin:
                return "Something"
            case .created:
                return "Something"
            case .location:
                return "Something"
            case .episodeCount:
                return "Something"
            }
        }
    }
    
    
    init(type: `Type`, value: String
        ) {
            self.value = value
            self.type = type
        }
}
