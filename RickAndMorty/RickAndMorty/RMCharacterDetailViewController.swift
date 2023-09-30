//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/30/23.
//

import UIKit

/// Controller to detail of characters
///
final class RMCharacterDetailViewController: UIViewController {

    private let viewModel: RMCharacterDetailViewViewModel
    
     init(viewModel: RMCharacterDetailViewViewModel) {
         
         self.viewModel = viewModel
         
         super.init(nibName: nil, bundle: nil)
        
    }
    
    required init? (coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        
    }

}
