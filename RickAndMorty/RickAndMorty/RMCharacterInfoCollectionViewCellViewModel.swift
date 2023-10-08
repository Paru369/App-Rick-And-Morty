//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/6/23.
//

import UIKit


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
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor? {
        return type.tintColor
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
        
        var tintColor: UIColor? {
            switch self {
            case .status:
                return .blue
            case .gender:
                return .systemPink
            case .type:
                return .red
            case .species:
                return .purple
            case .origin:
                return .systemGreen
            case .created:
                return .magenta
            case .location:
                return .systemCyan
            case .episodeCount:
                return .cyan
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "")
            case .type:
                return UIImage(systemName: "")
            case .species:
                return UIImage(systemName: "")
            case .origin:
                return UIImage(systemName: "")
            case .created:
                return UIImage(systemName: "")
            case .location:
                return UIImage(systemName: "")
            case .episodeCount:
                return UIImage(systemName: "")
            }
        }
        
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
