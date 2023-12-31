//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/16/23.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController, RMCharacterListViewDelegate {
   
    

    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        setupView()
        addSearchButton()
    }
    
    private func addSearchButton() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc private func didTapSearch() {
        let vc = RMSearchViewController(config: RMSearchViewController.Config(type: .character))
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupView() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate ([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    //MARK: - RMCharacterListViewDelegate
    
    
    func rmCharacterListView(_ characterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        // open detil controle for that chracter
        
        let viewModel = RMCharacterDetailViewViewModel(character: character)
        let detailVC = RMCharacterDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
        
        
    }
}
