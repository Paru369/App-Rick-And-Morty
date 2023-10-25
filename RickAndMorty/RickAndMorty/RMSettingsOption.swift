//
//  RMSettingsOption.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/24/23.
//

import Foundation

import UIKit

enum RMSettingsOption: CaseIterable {
    case rateApp
    case contactMe
    case terms
    case license
    case apiReference
    case viewSeries
    case viewCode

    var targetUrl: URL? {
        switch self {
        case .rateApp:
            return nil
        case .contactMe:
            return URL(string: "https://www.linkedin.com/in/paru369/")
        case .terms:
            return URL(string: "https://github.com/Paru369")
        case .license:
            return URL(string: "https://github.com/Paru369/App-Rick-And-Morty/blob/main/LICENSE")
        case .apiReference:
            return URL(string: "https://rickandmortyapi.com")
        case .viewSeries:
            return URL(string: "https://www.youtube.com/results?search_query=rick+and+morty")
        case .viewCode:
            return URL(string: "https://github.com/Paru369/App-Rick-And-Morty")
        }
    }

    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactMe:
            return "Linkedin"
        case .terms:
            return "Github"
        case .license:
            return "MIT License"
        case .apiReference:
            return "API Reference"
        case .viewSeries:
            return "View Rick and Morty on YT"
        case .viewCode:
            return "View App Code"
        }
    }

    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemBlue
        case .contactMe:
            return .systemGreen
        case .terms:
            return .systemRed
        case .license:
            return .systemYellow
        case .apiReference:
            return .systemOrange
        case .viewSeries:
            return .systemPurple
        case .viewCode:
            return .systemPink
        }
    }

    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactMe:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .license:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "list.clipboard")
        case .viewSeries:
            return UIImage(systemName: "tv.fill")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
}
