//
//  ProductDetailsViewModel.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 29.03.2023.
//

import Foundation
import UIKit


protocol DetailedProductDataPresentable: AnyObject {
    func getDetailedProduct()
}

final class ProductDetailsViewModel {
    
    weak var delegate: ProductDetailsViewModelListening?
    
    private var productDetailsDataProvider: ProductDetailsDataProviding
//    private var detailedProduct: DetailedProduct?
    
    init(productDetailsDataProvider: ProductDetailsDataProviding = ProductDetailsDataProvider()) {
        self.productDetailsDataProvider = productDetailsDataProvider
    }
    
}

extension ProductDetailsViewModel: DetailedProductDataPresentable {
    
    func getDetailedProduct() {
        let provideCompletion = { (detailedProduct: DetailedProduct) in
            self.delegate?.initializeView(detailedProduct: detailedProduct)
        }
        self.productDetailsDataProvider.provideProductDetailsData(provideCompletion: provideCompletion)
    }
    
}

