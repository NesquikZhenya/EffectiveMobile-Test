//
//  AllProductsDataProvider.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 13.02.2023.
//

import Foundation

protocol AllProductsDataProviding {
    func provideHotSalesPhonesData(provideCompletion: @escaping ([HotSalesPhone])->()?)
//    func getBestSellerPhonesData() -> [BestSellerPhone]
}

struct AllProductsDataProvider: AllProductsDataProviding { 
    
    let allProductsDataConverter = AllProductsDataConverter()
    
    
    func provideHotSalesPhonesData(provideCompletion: @escaping ([HotSalesPhone]) -> ()?) {
        
        let convertCompletion = { (hotSalesPhones: [HotSalesPhone]) in
            provideCompletion(hotSalesPhones)
        }
        
        allProductsDataConverter.convertHotSalesPhonesData(convertCompletion: convertCompletion)
            }
    
//    func getBestSellerPhonesData() -> [BestSellerPhone] {
////        return allProductsDataConverter.convertBestSellerPhonesData()
//    }
}
