//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 10/9/23.
//

import UIKit


/// VC to show details about single episode
class RMEpisodeDetailViewController: UIViewController {

    
    private let viewModel: RMEpisodeDetailViewViewModel
    
    
    
    // MARK: - Init
    init(url: URL?) {
        self.viewModel = .init(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .opaqueSeparator
    }

}
