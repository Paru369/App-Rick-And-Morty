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
    
    static let dateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
       let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    public var title: String {
        self.type.displayTitle
    }
    
    public var displayValue: String {
       
        if value.isEmpty {return "none"}
        
        
        if let date = Self.dateFormatter.date(from: value), type == .created {
            return Self.shortDateFormatter.string(from: date)
        }
        return value
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor? {
        return type.tintColor
    }
    
    
    enum `Type`: String{
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
            case .status,
   
             .gender,
         
             .type,
  
             .species,
           
             .origin,
    
             .created,
           
             .location:
                return rawValue.uppercased()
            case .episodeCount:
                return "EPISODE COUNT"
            }
        }
    }
    
    
    init(type: `Type`, value: String
        ) {
            self.value = value
            self.type = type
        }
}
