//
//  ProductDetailsView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 22.03.2023.
//

import UIKit

class ProductDetailsView: UIView {

//    private var product: BestSellerPhone
    
    private let productImagesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let productConfigurationView: UIView = {
        let view = ProductConfigurationView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
        loadViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: Configurating constraints

extension ProductDetailsView: ViewSetuping {

    func loadViews() {
        [
            productImagesScrollView,
            productConfigurationView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureProductImagesScrollViewConstraints()
        configureProductConfigurationViewConstraints()
        
        [
            productImagesScrollView,
            productConfigurationView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureProductImagesScrollViewConstraints() {
        [
            productImagesScrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 128),
            productImagesScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productImagesScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productImagesScrollView.heightAnchor.constraint(equalToConstant: 300)
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductConfigurationViewConstraints() {
        [
            productConfigurationView.topAnchor.constraint(equalTo: productImagesScrollView.bottomAnchor, constant: 8),
            productConfigurationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productConfigurationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productConfigurationView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
}

