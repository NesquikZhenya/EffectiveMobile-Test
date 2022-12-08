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
}

let categories = [
    ItemCategory(name: "Phones", imageName: "phone"),
    ItemCategory(name: "Computers", imageName: "computer"),
    ItemCategory(name: "Health", imageName: "health"),
    ItemCategory(name: "Books", imageName: "book"),
    ItemCategory(name: "Tablets", imageName: "tablet"),
    ItemCategory(name: "TVs", imageName: "tv")
]
