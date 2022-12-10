//
//  CategoriesData.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 07.12.2022.
//

import Foundation

struct ItemCategory {
    let name: String
    let imageName: String
    var isSelected: Bool
}

struct CategoriesData {
    
    var categories: [ItemCategory] = [
        ItemCategory(name: "Phones", imageName: "phone", isSelected: true),
        ItemCategory(name: "Computers", imageName: "computer", isSelected: false),
        ItemCategory(name: "Health", imageName: "health", isSelected: false),
        ItemCategory(name: "Books", imageName: "book", isSelected: false),
        ItemCategory(name: "Tablets", imageName: "tablet", isSelected: false),
        ItemCategory(name: "TVs", imageName: "tv", isSelected: false)
    ]
}
