//
//  FavouritesViewModel.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 17.03.2023.
//

import Foundation
import UIKit


protocol FavouritesDataPresentable: AnyObject {
    func getFavourites()
}

protocol FavouritesDataUpdating: AnyObject {
    func updateFavourite(favourite: BestSellerPhone)
}

final class FavouritesViewModel {
    
    weak var delegate: FavouritesViewModelListening?
    private let phonesDataStorage = PhonesDataStorage()
    
    private var allProductsDataProvider: AllProductsDataProviding
    private var bestSellerPhones: [BestSellerPhone] = []

    init(allProductsDataProvider: AllProductsDataProviding = AllProductsDataProvider()) {
        self.allProductsDataProvider = allProductsDataProvider
    }
    
}

extension FavouritesViewModel: FavouritesDataPresentable {
    
    func getFavourites() {
        
        let fetchFavouritesCompletion = { (storedBestSellerPhones: [StoredBestSellerPhone]) in
                self.delegate?.initializeFavouritesView(favourites: transformed(storedBestSellerPhones: storedBestSellerPhones))
        }
        phonesDataStorage.fetchFavourites(completion: fetchFavouritesCompletion)
        
        func transformed(storedBestSellerPhones: [StoredBestSellerPhone]) -> [BestSellerPhone] {
            var bestSellerPhones: [BestSellerPhone] = []
            storedBestSellerPhones.forEach {
                let bestSellerPhone = BestSellerPhone(id: $0.id, isFavorites: $0.isFavorites, title: $0.title!, priceWithoutDiscount: $0.priceWithoutDiscount, discountPrice: $0.discountPrice, picture: $0.picture!)
                bestSellerPhones.append(bestSellerPhone)
            }
            return bestSellerPhones
        }
        
    }
    
}

extension FavouritesViewModel: FavouritesDataUpdating {
    
    func updateFavourite(favourite: BestSellerPhone) {
        self.phonesDataStorage.updateFavourite(bestSellerPhone: favourite)
    }
    
}

