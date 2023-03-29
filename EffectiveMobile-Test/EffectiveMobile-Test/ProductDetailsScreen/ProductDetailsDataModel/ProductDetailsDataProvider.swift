//
//  ProductDetailsDataProvider.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 29.03.2023.
//

import Foundation

protocol ProductDetailsDataProviding {
    func provideProductDetailsData(productId: Int32, provideCompletion: @escaping (DetailedProduct)->()?)
}

struct ProductDetailsDataProvider: ProductDetailsDataProviding {
    
    let productDetailsDataConverter = ProductDetailsDataConverter()
    
    func provideProductDetailsData(productId: Int32, provideCompletion: @escaping (DetailedProduct) -> ()?) {
        let convertCompletion = { (detailedProduct: DetailedProduct) in
            provideCompletion(detailedProduct)
        }
        
        productDetailsDataConverter.convertProductData(productId: productId, convertCompletion: convertCompletion)
    }
    
}
