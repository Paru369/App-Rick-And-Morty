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
        let request = RMRequest(endpoint: .character,
                                queryParameters: [
                                    URLQueryItem(name: "name", value: "morty"),
                                    URLQueryItem(name: "status", value: "dead")])
        
        print(request.url)
        
        //        RMService.shared.execute(request,
        //                                 expecting: RMCharacter.self) result in
        //        switch result {
        //        case . success(RMCharacter)
        //        }
        
        
    }
}
