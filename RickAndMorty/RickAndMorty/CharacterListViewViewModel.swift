//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/21/23.
//

import Foundation
func fetchCharacters() {
    RMService.shared.execute(.listCharactersRequests,
                             expecting: RMGetAllCharactersResponse.self) { result in
       
        switch result {
        case .success(let model):
      
            print("Total:"+String(model.info.count))
            print("Page count:"+String(model.results.count))
        case .failure(let error):
            print(String(describing: error))

        }
    }
}
