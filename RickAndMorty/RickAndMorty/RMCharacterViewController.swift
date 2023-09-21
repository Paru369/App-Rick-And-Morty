//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/16/23.
//

import UIKit

/// Controller to show and search for characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        
        RMService.shared.execute(.listCharactersRquest,
                                 expecting: String.self) { result in
            print(result)
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
             print("888")
                //print(String(describing: error))

            }
        }
    }
}
