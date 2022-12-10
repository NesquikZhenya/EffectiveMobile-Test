//
//  CategoriesDataProvider.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 10.12.2022.
//

import Foundation

protocol CategoriesDataProviding {
    
    var selectedCategoryId: Int { get set }
    
    func getCategories() -> [ItemCategory]
    mutating func setCategories(newCategories: [ItemCategory])
    mutating func categoryDidTap(newSelectedId: Int, oldSelectedId: Int)
    
}

struct CategoriesDataProvider: CategoriesDataProviding {
    
    var categoriesData = CategoriesData()
        
    var selectedCategoryId: Int = .zero
    
    func getCategories() -> [ItemCategory] {
        return categoriesData.categories
    }
    
    mutating func setCategories(newCategories: [ItemCategory]) {
        categoriesData.categories = newCategories
    }
    
    mutating func categoryDidTap(newSelectedId: Int, oldSelectedId: Int) {
        categoriesData.categories[oldSelectedId].isSelected.toggle()
        categoriesData.categories[newSelectedId].isSelected.toggle()
    }
    
}
