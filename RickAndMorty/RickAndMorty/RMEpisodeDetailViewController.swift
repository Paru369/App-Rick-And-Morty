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
    private let detailView = RMEpisodeDetailView()
    
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
        view.addSubviews(detailView)
        addConstraints()
        title = "Episode"
        view.backgroundColor = .opaqueSeparator
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc
    private func didTapShare() {
        
    }

}
