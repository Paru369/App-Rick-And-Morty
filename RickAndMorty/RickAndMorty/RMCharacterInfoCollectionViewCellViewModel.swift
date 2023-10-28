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
                return  .systemIndigo
            case .gender:
                return  .systemIndigo
            case .type:
                return .systemMint
            case .species:
                return .systemMint
            case .origin:
                return .systemIndigo
            case .created:
                return .systemMint
            case .location:
                return .systemIndigo
            case .episodeCount:
                return .systemMint
                    
                 
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "heart.fill")
            case .gender:
                return UIImage(systemName: "figure.dress.line.vertical.figure")
            case .type:
                return UIImage(systemName: "face.dashed")
            case .species:
                return UIImage(systemName: "person.fill.questionmark")
            case .origin:
                return UIImage(systemName: "mappin.circle")
            case .created:
                return UIImage(systemName: "clock")
            case .location:
                return UIImage(systemName: "map")
            case .episodeCount:
                return UIImage(systemName: "sum")
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
