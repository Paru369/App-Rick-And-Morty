//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/30/23.
//

import UIKit

/// View for single character info
final class RMCharacterDetailView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemYellow
    }

    required init?(coder: NSCoder) {
    fatalError("Unsuported")
}
    
}

