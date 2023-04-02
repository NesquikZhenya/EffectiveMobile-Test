//
//  ProductConfigurationView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 24.03.2023.
//

import UIKit

final class ProductConfigurationView: UIView {

    private var colorId: Int?
    private var capacityId: Int?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Medium", size: 24)
        return label
    }()

    lazy var favouriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(favouriteButtonDidTap), for: .touchUpInside)
        return button
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
    
    private let productRatingView: ProductRatingView = {
        let view = ProductRatingView()
        return view
    }()
    
    lazy var productInfoLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(createProductInfoLabel(title: "Shop"))
        stackView.addArrangedSubview(createProductInfoLabel(title: "Details"))
        stackView.addArrangedSubview(createProductInfoLabel(title: "Features"))
        stackView.arrangedSubviews.forEach {
            let infoGesture = UITapGestureRecognizer(target: self, action: #selector(infoDidTap))
            $0.addGestureRecognizer(infoGesture)
        }
        return stackView
    }()
    
    private func createProductInfoLabel(title: String) -> UILabel {
        let label = UILabel()
        label.text = title
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 20)
        label.isUserInteractionEnabled = true
        return label
    }
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        return view
    }()

    private let productInfoShopView: ProductInfoShopView = {
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
    
    lazy var cartGesture = UITapGestureRecognizer(target: self, action: #selector(addButtonDidTap))

    lazy var cartButtonView: CartButtonView = {
        let view = CartButtonView()
        view.addGestureRecognizer(cartGesture)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        loadViews()
        setupConstraints()
        productInfoShopView.delegate = self
        cartButtonView.delegate = self
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
            favouriteButton,
            productRatingView,
            productInfoLabelsStackView,
            underlineView,
            productInfoShopView,
            productInfoDetailsView,
            productInfoFeaturesView,
            cartButtonView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureTitleLabelConstraints()
        configureFavouriteButtonConstraints()
        configureProductRatingViewConstraints()
        configureProductInfoLabelsStackViewConstraints()
        configureUnderlineViewConstraints()
        configureProductInfoShopViewConstraints()
        configureProductInfoDetailsViewConstraints()
        configureProductInfoFeaturesViewConstraints()
        configureCartButtonViewConstraints()
        
        [
            titleLabel,
            favouriteButton,
            productRatingView,
            productInfoLabelsStackView,
            underlineView,
            productInfoShopView,
            productInfoDetailsView,
            productInfoFeaturesView,
            cartButtonView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureTitleLabelConstraints() {
        [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 38)
        ].forEach { $0.isActive = true }
    }
    
        private func configureFavouriteButtonConstraints() {
            [
                favouriteButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
                favouriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -38),
                favouriteButton.heightAnchor.constraint(equalToConstant: 32),
                favouriteButton.widthAnchor.constraint(equalToConstant: 38)
            ].forEach { $0.isActive = true }
        }

    private func configureProductRatingViewConstraints() {
        [
            productRatingView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            productRatingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 38)
        ].forEach { $0.isActive = true }
    }

    private func configureProductInfoLabelsStackViewConstraints() {
        [
            productInfoLabelsStackView.topAnchor.constraint(equalTo: productRatingView.bottomAnchor, constant: 24),
            productInfoLabelsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            productInfoLabelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ].forEach { $0.isActive = true }
    }

    private func configureUnderlineViewConstraints() {
        [
            underlineView.topAnchor.constraint(equalTo: productInfoLabelsStackView.arrangedSubviews[0].bottomAnchor, constant: 8),
            underlineView.centerXAnchor.constraint(equalTo: productInfoLabelsStackView.arrangedSubviews[0].centerXAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 2),
            underlineView.widthAnchor.constraint(equalToConstant: 80)
        ].forEach { $0.isActive = true }
    }

    private func configureProductInfoShopViewConstraints() {
        [
            productInfoShopView.topAnchor.constraint(equalTo: underlineView.bottomAnchor),
            productInfoShopView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productInfoShopView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ].forEach { $0.isActive = true }
    }

    private func configureProductInfoDetailsViewConstraints() {
        [
//            underlineView.topAnchor.constraint(equalTo: productInfoShopLabel.bottomAnchor, constant: 8),
            underlineView.centerXAnchor.constraint(equalTo: productInfoLabelsStackView.arrangedSubviews[0].centerXAnchor)
        ].forEach { $0.isActive = true }
    }

    private func configureProductInfoFeaturesViewConstraints() {
        [
//            underlineView.topAnchor.constraint(equalTo: productInfoShopLabel.bottomAnchor, constant: 8),
            underlineView.centerXAnchor.constraint(equalTo: productInfoLabelsStackView.arrangedSubviews[0].centerXAnchor)
        ].forEach { $0.isActive = true }
    }

    private func configureCartButtonViewConstraints() {
        [
            cartButtonView.topAnchor.constraint(equalTo: productInfoShopView.bottomAnchor, constant: 24),
            cartButtonView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            cartButtonView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            cartButtonView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)
        ].forEach { $0.isActive = true }
    }

}

//MARK: Configurating View

extension ProductConfigurationView {
    
    func initializeView(detailedProduct: DetailedProduct) {
        titleLabel.text = detailedProduct.title
        favouriteButton.setImage(heartImage(isFavourite: detailedProduct.isFavorites), for: .normal)
        productRatingView.initializeView(rating: detailedProduct.rating)
        productInfoShopView.initializeView(detailedProduct: detailedProduct)
        cartButtonView.initializeView(price: detailedProduct.price)
    }
    
    private func heartImage(isFavourite: Bool) -> UIImage? {
        if isFavourite {
            return UIImage(named: "favourite")
        } else {
            return UIImage(named: "notFavourite")
        }
    }
}

extension ProductConfigurationView {
    
    @objc private func favouriteButtonDidTap() {
        if favouriteButton.image(for: .normal) == UIImage(named: "favourite") {
            favouriteButton.setImage(UIImage(named: "notFavourite"), for: .normal)
        } else {
            favouriteButton.setImage(UIImage(named: "favourite"), for: .normal)
        }
    }
    
    @objc private func infoDidTap() {
        print("test")
    }
    
    @objc private func addButtonDidTap() {
        cartButtonView.firstAdded()
        cartButtonView.removeGestureRecognizer(cartGesture)
    }
    
}

extension ProductConfigurationView: ColorAndCapacityListening {
    
    func setColorId(id: Int?) {
        self.colorId = id
        if self.colorId != nil && self.capacityId != nil{
            cartButtonView.alpha = 1
            cartButtonView.isUserInteractionEnabled = true
        }
    }
    
    func setCapacityId(id: Int?) {
        self.capacityId = id
        if self.colorId != nil && self.capacityId != nil{
            cartButtonView.alpha = 1
            cartButtonView.isUserInteractionEnabled = true
        }
    }
    
}

extension ProductConfigurationView: FirstRemovedListening {
    
    func firstRemoved() {
        cartButtonView.addGestureRecognizer(cartGesture)
    }
    
}


