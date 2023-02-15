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
    
    func getHotSalesPhones(completion: @escaping ([HotSalesPhone])->()?)
    
}

protocol BestSellerDataPresentable: AnyObject {
    
    var bestSellerPhones: [BestSellerPhone] { get }
    
}

final class AllProductsViewModel {
    
    weak var delegate: AllProductsViewModelListening?
    
    private var categoriesDataProvider: CategoriesDataProviding
    private var allProductsDataProvider: AllProductsDataProviding
    
    
    init(categoriesDataProvider: CategoriesDataProviding = CategoriesDataProvider(), allProductsDataProvider: AllProductsDataProviding = AllProductsDataProvider()) {
        self.categoriesDataProvider = categoriesDataProvider
        self.allProductsDataProvider = allProductsDataProvider
    }
    
    var provideCompletion = { (hotSalesPhones: [HotSalesPhone]) in
        
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
    
    func getHotSalesPhones(completion: @escaping ([HotSalesPhone]) -> ()?) {
        let provideCompletion = { (hotSalesPhones: [HotSalesPhone]) in
            completion(hotSalesPhones)
        }
        
        allProductsDataProvider.provideHotSalesPhonesData(provideCompletion: provideCompletion)
    }
    

    
}

//extension AllProductsViewModel: BestSellerDataPresentable {
//    
//    var bestSellerPhones: [BestSellerPhone] {
//        allProductsDataProvider.getBestSellerPhonesData()
//    }
//    
//}

