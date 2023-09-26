//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/25/23.
//

import UIKit

/// Silge cell for a character
class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsuported")
    }
    
    private func addConstraint() {
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel ) {
        
    }
}
