//
//  RMCharacterListViewViewViewModel.swift
//  RickAndMorty
//
//  Created by Paulo Pinheiro on 9/21/23.
//


import UIKit

protocol RMCharacterListViewViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didSelectCharater(_ character: RMCharacter)
    func didLoadMoreCharacter(with newIndexPath: [IndexPath])
}

/// ViewModel to hadle character list view logic
final class RMCharacterListViewViewModel: NSObject {
    
    
    public weak var delegate: RMCharacterListViewViewViewModelDelegate?
    
    private var isLoadingMoreCharacter = false
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters  {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                    )
                if !cellViewModels.contains(viewModel) {
                    cellViewModels.append(viewModel)
                }
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    private var apiInfo: RMGetAllCharactersResponse.Info? = nil
    
    /// Fetch inital set of characters
   public func fetchCharacters() {
        RMService.shared.execute(.listCharactersRequests,
                                 expecting: RMGetAllCharactersResponse.self
        ) { [weak self] result in
            
            switch result {
            case .success(let responserMoldel):
                let results = responserMoldel.results
                let info = responserMoldel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
                
            }
        }
    }
    
    /// Paginate if addicitonal characters are needed
    public func fetchAdditionaCharacters(url: URL) {
        guard !isLoadingMoreCharacter else {
            return
        }
        isLoadingMoreCharacter = true
        guard let request = RMRequest(url:url) else {
            isLoadingMoreCharacter = false
            return
        }
        
        RMService.shared.execute(request,
                                 expecting: RMGetAllCharactersResponse.self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            
            switch result {
            case .success (let responserMoldel):
                let newResults = responserMoldel.results
                let newInfo = responserMoldel.info
                strongSelf.apiInfo = newInfo
                
                let originalCount = strongSelf.characters.count
                let newCount = newResults.count
                let total = originalCount + newCount
                let startIndex = total - newCount
                let indexPathsToAdd: [IndexPath] = Array(startIndex..<(startIndex+newCount)).compactMap({
                    return IndexPath(row: $0, section: 0)
                })
                
                strongSelf.characters.append(contentsOf: newResults)
                DispatchQueue.main.async {
                    strongSelf.delegate?.didLoadMoreCharacter(
                        with: indexPathsToAdd
                    )
                    strongSelf.isLoadingMoreCharacter = false
                }
                
            case .failure(let failure):
                self?.isLoadingMoreCharacter = false
            }
        }
    }
    
    public var shouldShowLoadMoreIndicator: Bool {
        return  apiInfo?.next != nil
    }
}

// MARK: CollectionView
extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsuported Cell")
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter,
            let footer = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: RMFooterLoadingCollectionReusableView.identifier,
            for: indexPath
        ) as? RMFooterLoadingCollectionReusableView else {
        fatalError("SpinnerError")
    }
        footer.startAnimating()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowLoadMoreIndicator else {
            return .zero
        }
        return CGSize(
            width: collectionView.frame.width,
            height: 100)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width * 1.2)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharater(character)
    }
}


//MARK - ScrollView

extension RMCharacterListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //
        guard shouldShowLoadMoreIndicator,
        !isLoadingMoreCharacter,
        !cellViewModels.isEmpty,
            
        let nextUrlString = apiInfo?.next,
        let url = URL(string:nextUrlString) else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] t in
            let offset = scrollView.contentOffset.y
            let totalContentHeight = scrollView.contentSize.height
            let totalScrollViewFixedHeight = scrollView.frame.size.height
            
            if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
                self?.fetchAdditionaCharacters(url: url)
            }
            t.invalidate()
        }
    }
}
