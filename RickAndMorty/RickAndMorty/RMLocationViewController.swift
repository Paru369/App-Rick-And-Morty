//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/16/23.
//

import UIKit

/// Controller to show and search for Loctations
final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Loctations"
        addSearchButton()
    }
    
    private func addSearchButton() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearch))
    }
    
    @objc private func didTapSearch() {
        
    }
  

}
