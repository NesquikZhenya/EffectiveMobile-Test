//
//  CategoriesViewModel.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 07.12.2022.
//

import Foundation

struct CategoriesViewModel {
    private let categoriesData = CategoriesData()
    
    lazy var categories: [ItemCategory] = {
        return categoriesData.categories
    }()
    
    var selectedCategory: Int = 0
}

