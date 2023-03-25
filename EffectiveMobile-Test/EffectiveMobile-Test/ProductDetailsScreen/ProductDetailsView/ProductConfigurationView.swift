////
////  ProductConfigurationView.swift
////  EffectiveMobile-Test
////
////  Created by Евгений Михневич on 24.03.2023.
////
//
//import UIKit
//
//class ProductConfigurationView: UIView {
//
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Galaxy"
//        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
//        label.font = UIFont(name: "MarkPro-Medium", size: 24)
//        return label
//    }()
//    
//    private let favouriteBackgroundView: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = 10
//        view.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
//        return view
//    }()
//    
//    private let favouriteImageView: UIImageView = {
//        let imageView = UIImageView()
//        return imageView
//    }()
//    
//    private let productRatingView: UIView = {
//        let view = ProductRatingView()
//        return view
//    }()
//    
//    private let productInfoShopLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Shop"
//        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
//        label.font = UIFont(name: "MarkPro-Bold", size: 20)
//        return label
//    }()
//    
//    private let productInfoDetailsLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Details"
//        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
//        label.font = UIFont(name: "MarkPro-Regular", size: 20)
//        return label
//    }()
//    
//    private let productInfoFeaturesLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Shop"
//        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
//        label.font = UIFont(name: "MarkPro-Bold", size: 20)
//        return label
//    }()
//    
//    private let underlineView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
//        return view
//    }()
//    
//    private let productInfoShopView: UIView = {
//        let view = ProductInfoShopView()
//        return view
//    }()
//
//    private let productInfoDetailsView: UIView = {
//        let view = ProductInfoDetailsView()
//        return view
//    }()
//
//    private let productInfoFeaturesView: UIView = {
//        let view = ProductInfoFeaturesView()
//        return view
//    }()
//    
//    private let cartButton: UIButton = {
//        var font = AttributeContainer()
//        font.font = UIFont(name: "MarkPro-Bold", size: 20)
//        var config = UIButton.Configuration.filled()
//        config.attributedTitle = AttributedString("Add to Cart", attributes: font)
//        config.baseForegroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
//        config.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 45, bottom: 15, trailing: 38)
//        config.background.cornerRadius = 10
//        config.titleAlignment = .leading
//    
//        let button = UIButton()
//        button.configuration = config
//        button.tintColor = UIColor(red: 0.337, green: 0.49, blue: 0.957, alpha: 1)
//        return button
//    }()
//        
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
//        loadViews()
//        setupConstraints()
//    }
//    
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
////MARK: Configurating constraints
//
//extension ProductConfigurationView: ViewSetuping {
//
//    func loadViews() {
//        [
//            productImagesScrollView,
//            productConfigurationView
//        ].forEach {self.addSubview($0)}
//    }
//    
//    func setupConstraints() {
//        configureProductImagesScrollViewConstraints()
//        configureproductConfigurationViewConstraints()
//        
//        [
//            productImagesScrollView,
//            productConfigurationView
//        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
//    }
//    
//    private func configureProductImagesScrollViewConstraints() {
//        [
//            productImagesScrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 128),
//            productImagesScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            productImagesScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
//        ].forEach { $0.isActive = true }
//    }
//    
//    private func configureproductConfigurationViewConstraints() {
//        [
//            productConfigurationView.topAnchor.constraint(equalTo: productImagesScrollView.bottomAnchor, constant: 8),
//            productConfigurationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            productConfigurationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            productConfigurationView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ].forEach { $0.isActive = true }
//    }
//    
//}
//
