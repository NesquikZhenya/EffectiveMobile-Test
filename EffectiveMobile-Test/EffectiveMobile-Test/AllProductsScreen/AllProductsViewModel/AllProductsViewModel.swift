//
//  AllProductsViewModel.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 10.12.2022.
//

import Foundation

protocol CategoriesDataPresentable: AnyObject {
    
    var selectedCategoryId: Int { get set }
    var categories: [ItemCategory] { get set }
    
    func categoryDidTap(newSelectedId: Int )
}

protocol HotSalesDataPresentable: AnyObject {
    
    var hotSalesPhones: [HotSalesPhone] { get }
    
}

final class AllProductViewModel {
    
    weak var delegate: AllProductsViewModelListening?
    
    private var categoriesDataProvider: CategoriesDataProviding
    private var hotSalesDataProvider: HotSalesDataProviding
    
    init(categoriesDataProvider: CategoriesDataProviding = CategoriesDataProvider(), hotSalesDataProvider: HotSalesDataProviding = HotSalesDataProvider()) {
        self.categoriesDataProvider = categoriesDataProvider
        self.hotSalesDataProvider = hotSalesDataProvider
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

extension AllProductViewModel: HotSalesDataPresentable {
    
    var hotSalesPhones: [HotSalesPhone] {
        hotSalesDataProvider.getHotSalesPhones()
    }
    
}

