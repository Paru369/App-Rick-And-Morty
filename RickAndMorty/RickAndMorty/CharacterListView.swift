//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/21/23.
//

import UIKit
/// View that handles showing list of characters, loader, etc
class CharacterListView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
        
    }
    required init?(coder: NSCoder) {
        fatalError("Unsuported")
    }
}
