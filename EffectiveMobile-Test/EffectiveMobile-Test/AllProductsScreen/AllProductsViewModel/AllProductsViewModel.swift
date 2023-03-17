//
//  AllProductsViewModel.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 10.12.2022.
//

import Foundation
import UIKit

protocol CategoriesDataPresentable: AnyObject {
    
    var selectedCategoryId: Int { get set }
    var categories: [ItemCategory] { get set }
    
    func categoryDidTap(newSelectedId: Int )
}

protocol HotSalesDataPresentable: AnyObject {
    func getHotSalesPhones()
}

protocol BestSellerDataPresentable: AnyObject {
    func getBestSellerPhones()
}

protocol BestSellerDataUpdating: AnyObject {
    func updateBestSellerPhones(bestSellerPhones: [BestSellerPhone])
}

final class AllProductsViewModel {
    
    weak var delegate: AllProductsViewModelListening?
    private let phonesDataStorage = PhonesDataStorage()
    
    private var categoriesDataProvider: CategoriesDataProviding
    private var allProductsDataProvider: AllProductsDataProviding
    private var hotSalesPhones: [HotSalesPhone] = []
    private var bestSellerPhones: [BestSellerPhone] = []

    init(categoriesDataProvider: CategoriesDataProviding = CategoriesDataProvider(), allProductsDataProvider: AllProductsDataProviding = AllProductsDataProvider()) {
        self.categoriesDataProvider = categoriesDataProvider
        self.allProductsDataProvider = allProductsDataProvider
    }
    
}

extension AllProductsViewModel: CategoriesDataPresentable {
    
    var selectedCategoryId: Int {
        get {
            categoriesDataProvider.selectedCategoryId
        }
        set {
            categoriesDataProvider.selectedCategoryId = newValue
        }
    }
    
    var categories: [ItemCategory] {
        get {
            categoriesDataProvider.getCategories()
        }
        set {
            categoriesDataProvider.setCategories(newCategories: newValue)
        }
    }
    
    func categoryDidTap(newSelectedId: Int) {
        categoriesDataProvider.categoryDidTap(newSelectedId: newSelectedId, oldSelectedId: selectedCategoryId)
        self.selectedCategoryId = newSelectedId
    }
    
}

extension AllProductsViewModel: HotSalesDataPresentable {
    
    func getHotSalesPhones() {
        let provideCompletion = { (hotSalesPhones: [HotSalesPhone]) in
            self.hotSalesPhones = hotSalesPhones
            self.delegate?.initializeHotSalesView(hotSalesPhones: hotSalesPhones)
        }
        if self.hotSalesPhones.isEmpty == true {
            allProductsDataProvider.provideHotSalesPhonesData(provideCompletion: provideCompletion)
        } else {
            self.delegate?.initializeHotSalesView(hotSalesPhones: hotSalesPhones)
        }
    }
    
}

extension AllProductsViewModel: BestSellerDataPresentable {
    
    func getBestSellerPhones() {
        
        let fetchStoredBestSellersPhoneCompletion = { (storedBestSellerPhones: [StoredBestSellerPhone]) in
            if storedBestSellerPhones.isEmpty {
                let provideCompletion = { (bestSellerPhones: [BestSellerPhone]) in
                    self.phonesDataStorage.saveAll(bestSellerPhones: bestSellerPhones)
                    self.delegate?.initializeBestSellerCollectionView(bestSellerPhones: bestSellerPhones)
                }
                self.allProductsDataProvider.provideBestSellerPhonesData(provideCompletion: provideCompletion)
            } else {
                self.delegate?.initializeBestSellerCollectionView(bestSellerPhones: transformed(storedBestSellerPhones: storedBestSellerPhones))
            }
        }
        phonesDataStorage.fetchAll(completion: fetchStoredBestSellersPhoneCompletion)
        
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

extension AllProductsViewModel: BestSellerDataUpdating {
    
    func updateBestSellerPhones(bestSellerPhones: [BestSellerPhone]) {
        self.phonesDataStorage.updateAllFavourites(bestSellerPhones: bestSellerPhones)
    }
    
}
