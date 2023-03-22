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
            
    var selectedCategoryId: Int = .zero
    
    func getCategories() -> [ItemCategory] {
        return CategoriesData.shared.categories
    }
    
    mutating func setCategories(newCategories: [ItemCategory]) {
        CategoriesData.shared.categories = newCategories
    }
    
    mutating func categoryDidTap(newSelectedId: Int, oldSelectedId: Int) {
        CategoriesData.shared.categories[oldSelectedId].isSelected.toggle()
        CategoriesData.shared.categories[newSelectedId].isSelected.toggle()
    }
    
}
