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
    
    lazy var productInfoButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(createProductInfoButton(title: "Shop"))
        stackView.addArrangedSubview(createProductInfoButton(title: "Details"))
        stackView.addArrangedSubview(createProductInfoButton(title: "Features"))
        return stackView
    }()
    
    private func createProductInfoButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.addTarget(self, action: #selector(infoDidTap), for: .touchUpInside)
        return button
    }
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        return view
    }()
    
    private var underliveViewLeadingConstraints: [NSLayoutConstraint] = []
    private var underliveViewTrailingConstraints: [NSLayoutConstraint] = []

    lazy var productInfoScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        let view = UIView()
        view.addSubview(productInfoShopView)
        view.addSubview(productInfoDetailsView)
        view.addSubview(productInfoFeaturesView)
        scrollView.addSubview(view)
        return scrollView
    }()
    
    private var scrollViewPosition: Int = 0
    
    private let productInfoShopView: ProductInfoShopView = {
        let view = ProductInfoShopView()
        return view
    }()

    private let productInfoDetailsView: ProductInfoDetailsView = {
        let view = ProductInfoDetailsView()
        return view
    }()

    private let productInfoFeaturesView: ProductInfoFeaturesView = {
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
        productInfoScrollView.delegate = self
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
            productInfoButtonsStackView,
            underlineView,
            productInfoScrollView,
            cartButtonView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureTitleLabelConstraints()
        configureFavouriteButtonConstraints()
        configureProductRatingViewConstraints()
        configureProductInfoButtonsStackViewConstraints()
        configureUnderlineViewConstraints()
        configureProductInfoScrollViewConstraints()
        configureCartButtonViewConstraints()
        
        [
            titleLabel,
            favouriteButton,
            productRatingView,
            productInfoButtonsStackView,
            underlineView,
            productInfoScrollView,
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

    private func configureProductInfoButtonsStackViewConstraints() {
        [
            productInfoButtonsStackView.topAnchor.constraint(equalTo: productRatingView.bottomAnchor, constant: 24),
            productInfoButtonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            productInfoButtonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ].forEach { $0.isActive = true }
    }

    private func configureUnderlineViewConstraints() {
        for i in 0...productInfoButtonsStackView.arrangedSubviews.count - 1 {
            underliveViewLeadingConstraints.append(underlineView.leadingAnchor.constraint(equalTo: productInfoButtonsStackView.arrangedSubviews[i].leadingAnchor, constant: -10))
            underliveViewTrailingConstraints.append(underlineView.trailingAnchor.constraint(equalTo: productInfoButtonsStackView.arrangedSubviews[i].trailingAnchor, constant: 10))
        }

        [
            underlineView.topAnchor.constraint(equalTo: productInfoButtonsStackView.arrangedSubviews[0].bottomAnchor, constant: 8),
            underliveViewLeadingConstraints[0],
            underliveViewTrailingConstraints[0],
            underlineView.heightAnchor.constraint(equalToConstant: 2)
        ].forEach { $0.isActive = true }
    }
    
    private func configureProductInfoScrollViewConstraints() {
        [
            productInfoScrollView.topAnchor.constraint(equalTo: underlineView.bottomAnchor),
            productInfoScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            productInfoScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            productInfoScrollView.heightAnchor.constraint(equalToConstant: 175)
        ].forEach { $0.isActive = true }
        configureProductInfoScrollSubviewConstraints()

    }
    
    private func configureProductInfoScrollSubviewConstraints() {
        [
            productInfoScrollView.subviews[0].topAnchor.constraint(equalTo: productInfoScrollView.topAnchor ),
            productInfoScrollView.subviews[0].leadingAnchor.constraint(equalTo: productInfoScrollView.leadingAnchor),
            productInfoScrollView.subviews[0].trailingAnchor.constraint(equalTo: productInfoScrollView.trailingAnchor),
            productInfoScrollView.subviews[0].bottomAnchor.constraint(equalTo: productInfoScrollView.bottomAnchor),
            productInfoScrollView.subviews[0].heightAnchor.constraint(equalTo: productInfoScrollView.heightAnchor)
        ].forEach { $0.isActive = true }
        productInfoScrollView.subviews[0].translatesAutoresizingMaskIntoConstraints = false
        configureProductInfoShopViewConstraints()
        configureProductInfoDetailsViewConstraints()
        configureProductInfoFeaturesViewConstraints()
    }

    private func configureProductInfoShopViewConstraints() {
        [
            productInfoShopView.topAnchor.constraint(equalTo: productInfoScrollView.subviews[0].topAnchor ),
            productInfoShopView.leadingAnchor.constraint(equalTo: productInfoScrollView.subviews[0].leadingAnchor),
            productInfoShopView.bottomAnchor.constraint(equalTo: productInfoScrollView.subviews[0].bottomAnchor),
            productInfoShopView.widthAnchor.constraint(equalTo: self.widthAnchor),
            productInfoShopView.heightAnchor.constraint(equalTo: productInfoScrollView.subviews[0].heightAnchor)
        ].forEach { $0.isActive = true }
        productInfoShopView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureProductInfoDetailsViewConstraints() {
        [
            productInfoDetailsView.topAnchor.constraint(equalTo: productInfoScrollView.subviews[0].topAnchor),
            productInfoDetailsView.leadingAnchor.constraint(equalTo: productInfoShopView.trailingAnchor),
            productInfoDetailsView.bottomAnchor.constraint(equalTo: productInfoScrollView.subviews[0].bottomAnchor),
            productInfoDetailsView.widthAnchor.constraint(equalTo: self.widthAnchor),
            productInfoDetailsView.heightAnchor.constraint(equalTo: productInfoScrollView.subviews[0].heightAnchor)
        ].forEach { $0.isActive = true }
        productInfoDetailsView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureProductInfoFeaturesViewConstraints() {
        [
            productInfoFeaturesView.topAnchor.constraint(equalTo: productInfoScrollView.subviews[0].topAnchor),
            productInfoFeaturesView.leadingAnchor.constraint(equalTo: productInfoDetailsView.trailingAnchor),
            productInfoFeaturesView.trailingAnchor.constraint(equalTo: productInfoScrollView.subviews[0].trailingAnchor),
            productInfoFeaturesView.bottomAnchor.constraint(equalTo: productInfoScrollView.subviews[0].bottomAnchor),
            productInfoFeaturesView.widthAnchor.constraint(equalTo: self.widthAnchor),
            productInfoFeaturesView.heightAnchor.constraint(equalTo: productInfoScrollView.subviews[0].heightAnchor),
        ].forEach { $0.isActive = true }
        productInfoFeaturesView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureCartButtonViewConstraints() {
        [
            cartButtonView.topAnchor.constraint(equalTo: productInfoScrollView.bottomAnchor, constant: 24),
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
    
    @objc private func infoDidTap(_ sender: UIButton) {
        switch sender.title(for: .normal) {
        case "Details":
            self.scrollViewPosition = 1
        case "Features":
            self.scrollViewPosition = 2
        default:
            self.scrollViewPosition = 0
        }
        scroll()
    }
    
    private func scroll() {
        self.productInfoScrollView.scrollRectToVisible(productInfoScrollView.subviews[0].subviews[scrollViewPosition].frame, animated: true)
        self.underliveViewLeadingConstraints.forEach { $0.isActive = false }
        self.underliveViewTrailingConstraints.forEach { $0.isActive = false }
        self.underliveViewLeadingConstraints[scrollViewPosition].isActive = true
        self.underliveViewTrailingConstraints[scrollViewPosition].isActive = true
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

extension ProductConfigurationView: UIScrollViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let translation = scrollView.panGestureRecognizer.translation(in: self).x
        if translation < -50 {
//            print(translation)
            if scrollViewPosition < 2 {
                scrollViewPosition += 1
                self.underliveViewLeadingConstraints.forEach { $0.isActive = false }
                self.underliveViewTrailingConstraints.forEach { $0.isActive = false }
                self.underliveViewLeadingConstraints[scrollViewPosition].isActive = true
                self.underliveViewTrailingConstraints[scrollViewPosition].isActive = true
            }
        } else if translation > 50 {
//            print(translation)
            if scrollViewPosition > 0 {
                scrollViewPosition -= 1
                self.underliveViewLeadingConstraints.forEach { $0.isActive = false }
                self.underliveViewTrailingConstraints.forEach { $0.isActive = false }
                self.underliveViewLeadingConstraints[scrollViewPosition].isActive = true
                self.underliveViewTrailingConstraints[scrollViewPosition].isActive = true
            }
        }
    }

    
}




