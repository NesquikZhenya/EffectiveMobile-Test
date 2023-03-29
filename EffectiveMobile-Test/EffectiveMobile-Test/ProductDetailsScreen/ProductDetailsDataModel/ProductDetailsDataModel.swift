//
//  ProductDetailsDataModel.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 29.03.2023.
//

import Foundation
import UIKit

struct DetailedProduct {
    let CPU: String
    let camera: String
    let capacity: [String]
    let colors: [UIColor]
    let id: Int
    let images: [URL]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}

struct DetailedProductDataModel: Codable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}
