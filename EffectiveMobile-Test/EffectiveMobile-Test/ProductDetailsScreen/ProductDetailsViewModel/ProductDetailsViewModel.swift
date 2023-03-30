//
//  ProductDetailsViewModel.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 29.03.2023.
//

import Foundation
import UIKit


protocol DetailedProductDataPresentable: AnyObject {
    func getDetailedProduct(productId: Int32)
}

final class ProductDetailsViewModel {
    
    weak var delegate: ProductDetailsViewModelListening?
    
    private var productDetailsDataProvider: ProductDetailsDataProviding
    
    init(productDetailsDataProvider: ProductDetailsDataProviding = ProductDetailsDataProvider()) {
        self.productDetailsDataProvider = productDetailsDataProvider
    }
    
}

extension ProductDetailsViewModel: DetailedProductDataPresentable {
    
    func getDetailedProduct(productId: Int32) {
        let provideCompletion = { (detailedProduct: DetailedProduct) in
            self.delegate?.initializeView(detailedProduct: detailedProduct)
        }
        self.productDetailsDataProvider.provideProductDetailsData(productId: productId, provideCompletion: provideCompletion)
    }
    
}

