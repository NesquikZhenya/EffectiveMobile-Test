//
//  ProductConfigurationView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 24.03.2023.
//

import UIKit

class ProductConfigurationView: UIView {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Galaxy Note 20 Ultra"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Medium", size: 24)
        return label
    }()
    
    private let favouriteBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        return view
    }()
    
    private let favouriteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "favourite")
        return imageView
    }()
    
    private let productRatingView: UIView = {
        let view = ProductRatingView()
        return view
    }()
    
    private let productInfoShopLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 20)
        return label
    }()
    
    private let productInfoDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Details"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 20)
        return label
    }()
    
    private let productInfoFeaturesLabel: UILabel = {
        let label = UILabel()
        label.text = "Features"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 20)
        return label
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        return view
    }()
    
    private let productInfoShopView: UIView = {
        let view = ProductInfoShopView()
        return view
    }()

    private let productInfoDetailsView: UIView = {
        let view = ProductInfoDetailsView()
        return view
    }()

    private let productInfoFeaturesView: UIView = {
        let view = ProductInfoFeaturesView()
        return view
    }()
    
    private let cartButtonView: UIView = {
        let view = CartButtonView()
        return view
    }()
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        loadViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: Configurating constraints

extension ProductConfigurationView: ViewSetuping {

    func loadViews() {
        [
            titleLabel,
            favouriteBackgroundView,
            favouriteImageView,
            productRatingView,
            productInfoShopLabel,
            productInfoDetailsLabel,
            productInfoFeaturesLabel,
            underlineView,
            productInfoShopView,
            productInfoDetailsView,
            productInfoFeaturesView,
            cartButtonView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureTitleLabelConstraints()
        configureFavouriteBackgroundView()
        configureFavouriteImageView()
        configureProductRatingView()
        configureProductInfoShopLabel()
        configureProductInfoDetailsLabel()
        configureProductInfoFeaturesLabel()
        configureUnderlineView()
        configureProductInfoShopView()
        configureProductInfoDetailsView()
        configureProductInfoFeaturesView()
        configureCartButtonView()
        
        [
            titleLabel,
            favouriteBackgroundView,
            favouriteImageView,
            productRatingView,
            productInfoShopLabel,
            productInfoDetailsLabel,
            productInfoFeaturesLabel,
            underlineView,
            productInfoShopView,
            productInfoDetailsView,
            productInfoFeaturesView,
            cartButtonView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureTitleLabelConstraints() {
        [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 28),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 38)
        ].forEach { $0.isActive = true }
    }
    
    private func configureFavouriteBackgroundView() {
        [
            favouriteBackgroundView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            favouriteBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -38),
            favouriteBackgroundView.heightAnchor.constraint(equalToConstant: 32),
            favouriteBackgroundView.widthAnchor.constraint(equalToConstant: 38)
        ].forEach { $0.isActive = true }
    }
    
    private func configureFavouriteImageView() {
        [
            favouriteImageView.centerYAnchor.constraint(equalTo: favouriteBackgroundView.centerYAnchor),
            favouriteImageView.centerXAnchor.constraint(equalTo: favouriteBackgroundView.centerXAnchor),
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductRatingView() {
        [
            productRatingView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            productRatingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 38)
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductInfoShopLabel() {
        [
            productInfoShopLabel.topAnchor.constraint(equalTo: productRatingView.bottomAnchor, constant: 32),
            productInfoShopLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45)
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductInfoDetailsLabel() {
        [
            productInfoDetailsLabel.topAnchor.constraint(equalTo: productRatingView.bottomAnchor, constant: 32),
            productInfoDetailsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductInfoFeaturesLabel() {
        [
            productInfoFeaturesLabel.topAnchor.constraint(equalTo: productRatingView.bottomAnchor, constant: 32),
            productInfoFeaturesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ].forEach { $0.isActive = true }
    }
    
    private func configureUnderlineView() {
        [
            underlineView.topAnchor.constraint(equalTo: productInfoShopLabel.bottomAnchor, constant: 8),
            underlineView.centerXAnchor.constraint(equalTo: productInfoShopLabel.centerXAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductInfoShopView() {
        [
            underlineView.topAnchor.constraint(equalTo: productInfoShopLabel.bottomAnchor, constant: 8),
            underlineView.centerXAnchor.constraint(equalTo: productInfoShopLabel.centerXAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductInfoDetailsView() {
        [
            underlineView.topAnchor.constraint(equalTo: productInfoShopLabel.bottomAnchor, constant: 8),
            underlineView.centerXAnchor.constraint(equalTo: productInfoShopLabel.centerXAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductInfoFeaturesView() {
        [
            underlineView.topAnchor.constraint(equalTo: productInfoShopLabel.bottomAnchor, constant: 8),
            underlineView.centerXAnchor.constraint(equalTo: productInfoShopLabel.centerXAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureCartButtonView() {
        [
            underlineView.topAnchor.constraint(equalTo: productInfoShopLabel.bottomAnchor, constant: 8),
            underlineView.centerXAnchor.constraint(equalTo: productInfoShopLabel.centerXAnchor)
        ].forEach { $0.isActive = true }
    }

}

