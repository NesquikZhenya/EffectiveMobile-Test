//
//  AllProductsViewModel.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 10.12.2022.
//

import Foundation



protocol CategoriesDataPresentable {
    
    var selectedCategoryId: Int { get set}
    var categories: [ItemCategory] {get set}
    
    func categoryDidTap(newSelectedId: Int )
}

final class AllProductViewModel {
    
    weak var delegate: AllProductsViewController?
    
    private var categoriesDataProvider: CategoriesDataProviding
    
    init(categoriesDataProvider: CategoriesDataProviding = CategoriesDataProvider()) {
        self.categoriesDataProvider = categoriesDataProvider
    }
    
}

extension AllProductViewModel: CategoriesDataPresentable {
    
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

