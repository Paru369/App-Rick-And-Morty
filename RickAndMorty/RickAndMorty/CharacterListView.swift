//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/21/23.
//

import UIKit
/// View that handles showing list of characters, loader, etc
class CharacterListView: UIView {

        private let viewModel = RMCharacterListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
        addSubview(spinner)
        addConstraints()
        spinner.startAnimating()
        
    }
    required init?(coder: NSCoder) {
        fatalError("Unsuported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            ])
    }
}
