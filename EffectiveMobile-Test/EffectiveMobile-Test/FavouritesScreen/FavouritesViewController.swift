//
//  FavouritesViewController.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 17.02.2023.
//

import UIKit

protocol FavouritesViewModelListening: AnyObject {
    func initializeFavouritesView(favourites: [BestSellerPhone])
}

class FavouritesViewController: UIViewController {
    
    private var favouritesViewModel: FavouritesViewModel
    
    let favouritesView = FavouritesView()
    private var favourites: [BestSellerPhone] = []
    
    init(favouritesViewModel: FavouritesViewModel = FavouritesViewModel()) {
        self.favouritesViewModel = favouritesViewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view = favouritesView
        favouritesViewModel.delegate = self
        favouritesView.favouritesCollectionView.dataSource = self
        favouritesView.favouritesCollectionView.delegate = self
        favouritesView.favouritesCollectionView.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "FavouritesCollectionViewCell")
        favouritesViewModel.getFavourites()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favouritesViewModel.getFavourites()
    }

}

extension FavouritesViewController: FavouritesViewModelListening {
    
    func initializeFavouritesView(favourites: [BestSellerPhone]) {
        self.favourites = favourites
        favouritesView.favouritesCollectionView.reloadData()
    }
    
}

extension FavouritesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = favouritesView.favouritesCollectionView.dequeueReusableCell(withReuseIdentifier: "FavouritesCollectionViewCell", for: indexPath) as? BestSellerCollectionViewCell {
            cell.configurePhone(bestSellerPhone: favourites[indexPath.row], cellIndexPath: indexPath)
            cell.delegate = self
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((UIScreen.main.bounds.width - 16*3)/2), height: (((UIScreen.main.bounds.width - 16*3)/2)+55))
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}

extension FavouritesViewController: FavouritesChangeListening {
    func favouritesDidTap(cellIndexPath: IndexPath) {
        self.favourites[cellIndexPath.row].isFavorites.toggle()
        self.favouritesView.favouritesCollectionView.reloadItems(at: [cellIndexPath])
    }
}
