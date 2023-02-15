//
//  AllProductsDataConverter.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 13.02.2023.
//

import Foundation
import UIKit

class AllProductsDataConverter {
    
    let allProductsDataFetcher = AllProductsDataFetcher()
    var allProductsData: AllProductsDataModel?
        
    func convertHotSalesPhonesData(convertCompletion: @escaping ([HotSalesPhone]) -> ()?) {
        
        var hotSalesPhones: [HotSalesPhone] = []
        
        let fetchCompletion = { (allProducts: AllProductsDataModel?) in
            allProducts?.home_store.forEach {
                let hotSalesPhone = HotSalesPhone(id: $0.id, isNew: $0.is_new, title: $0.title, subtitle: $0.subtitle, picture: URL(string:$0.picture)!, isBuy: $0.is_buy)
                hotSalesPhones.append(hotSalesPhone)
            }
            convertCompletion(hotSalesPhones)
        }
        allProductsDataFetcher.fetchAllProductsData(fetchCompletion: fetchCompletion)
    }
    
    func convertBestSellerPhonesData(convertCompletion: @escaping ([BestSellerPhone]) -> ()?) {
        
        var bestSellerPhones: [BestSellerPhone] = []
        
        let fetchCompletion = { (allProducts: AllProductsDataModel?) in
            allProducts?.best_seller.forEach {
                print($0.discount_price, $0.price_without_discount)
                let bestSellerPhone = BestSellerPhone(id: $0.id, isFavorites: $0.is_favorites, title: $0.title, priceWithoutDiscount: $0.price_without_discount, discountPrice: $0.discount_price, picture: URL(string:$0.picture)!)
                bestSellerPhones.append(bestSellerPhone)
                
            }
            convertCompletion(bestSellerPhones)
        }
        allProductsDataFetcher.fetchAllProductsData(fetchCompletion: fetchCompletion)
    }

}
