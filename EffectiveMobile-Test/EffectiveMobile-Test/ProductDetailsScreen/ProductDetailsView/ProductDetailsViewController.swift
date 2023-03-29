//
//  ProductDetailsViewController.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 22.03.2023.
//

import UIKit

protocol ProductDetailsViewModelListening: AnyObject {
    func initializeView(detailedProduct: DetailedProduct)
}

class ProductDetailsViewController: UIViewController {
    
    private var productId: Int32
    private let productDetailsView = ProductDetailsView()
    private var productDetailsViewModel = ProductDetailsViewModel()
    
    init(productId: Int32) {
        self.productId = productId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = productDetailsView
        productDetailsViewModel.delegate = self
        productDetailsViewModel.getDetailedProduct(productId: productId)
    }

}

extension ProductDetailsViewController: ProductDetailsViewModelListening {
    func initializeView(detailedProduct: DetailedProduct) {
        DispatchQueue.main.async {
            self.productDetailsView.initializeView(detailedProduct: detailedProduct)
        }
    }

}
