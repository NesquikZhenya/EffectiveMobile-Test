//
//  AllProductsData.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 13.02.2023.
//

import Foundation
import UIKit

struct HotSalesPhone {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: URL
    let isBuy: Bool
}

struct BestSellerPhone {
    let id: Int32
    var isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int32
    let discountPrice: Int32
    let picture: URL
}

struct HotSalesPhoneDataModel: Codable {
    let id: Int
    let is_new: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let is_buy: Bool
}

struct BestSellerPhoneDataModel: Codable {
    let id: Int
    let is_favorites: Bool
    let title: String
    let price_without_discount: Int
    let discount_price: Int
    let picture: String
}

struct AllProductsDataModel: Codable {
    let home_store: [HotSalesPhoneDataModel]
    let best_seller: [BestSellerPhoneDataModel]
}

struct AllProductsData {
    let hotSalesPhones: [HotSalesPhone]
    let bestSellerPhone: [BestSellerPhone]
}
