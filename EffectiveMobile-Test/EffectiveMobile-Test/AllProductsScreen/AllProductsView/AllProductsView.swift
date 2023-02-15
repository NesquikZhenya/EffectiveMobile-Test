//
//  AllProductsView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 05.12.2022.
//

import UIKit

final class AllProductsView: UIView {

    private let geolocationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "geolocation")
        return imageView
    }()
    
    private let geolocaionLabel: UILabel = {
        let label = UILabel()
        label.text = "Zihuatanejo, Gro"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Medium", size: 15)
        label.font = label.font.withSize(15)
        return label
    }()
    
    private let showMoreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "showMore")
        return imageView
    }()
    
    private let filtersImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "filters")
        return imageView
    }()
    
    private let selectCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Category"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.font = label.font.withSize(25)
        return label
    }()
    
    private let viewAllLabel: UILabel = {
        let label = UILabel()
        label.text = "view all"
        label.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 15)
        label.font = label.font.withSize(15)
        return label
    }()
    
    lazy var categoriesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    private let searchView: SearchView = {
        let view = SearchView()
        return view
    }()
    
    private lazy var qrImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "qr")
        imageView.widthAnchor.constraint(equalToConstant: 34).isActive = true
        return imageView
    }()
    
    private lazy var searchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchView, qrImageView])
        stackView.axis = .horizontal
        stackView.spacing = 11
        return stackView
    }()
    
    private let hotSalesView: HotSalesView = {
        let view = HotSalesView()
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

extension AllProductsView: ViewSetuping {
    
    func loadViews(){
        [
            geolocationImageView,
            geolocaionLabel,
            showMoreImageView,
            filtersImageView,
            selectCategoryLabel,
            viewAllLabel,
            categoriesCollectionView,
            searchStackView,
            hotSalesView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureGeolocationLabelConstraints()
        configureGeolocationImageViewConstraints()
        configureShowMoreImageViewConstraints()
        configureFiltersImageViewConstraints()
        configureSelectCategoryLabelConstraints()
        configureViewAllLabelConstraints()
        configureCategoriesCollectionViewConstraints()
        configureSearchStackViewConstraints()
        configureHotSalesViewConstraints()
        
        [
            geolocationImageView,
            geolocaionLabel,
            showMoreImageView,
            filtersImageView,
            selectCategoryLabel,
            viewAllLabel,
            categoriesCollectionView,
            searchStackView,
            hotSalesView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureGeolocationLabelConstraints() {
        [
            geolocaionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 64),
            geolocaionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureGeolocationImageViewConstraints() {
        [
            geolocationImageView.centerYAnchor.constraint(equalTo: geolocaionLabel.centerYAnchor),
            geolocationImageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 80),
            geolocationImageView.trailingAnchor.constraint(equalTo: geolocaionLabel.leadingAnchor, constant: -11)
        ].forEach { $0.isActive = true }
    }
    
    private func configureShowMoreImageViewConstraints() {
        [
            showMoreImageView.centerYAnchor.constraint(equalTo: geolocaionLabel.centerYAnchor),
            showMoreImageView.leadingAnchor.constraint(equalTo: geolocaionLabel.trailingAnchor, constant: 8),
            geolocationImageView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -80)
        ].forEach { $0.isActive = true }
    }
    
    private func configureFiltersImageViewConstraints() {
        [
            filtersImageView.centerYAnchor.constraint(equalTo: geolocaionLabel.centerYAnchor),
            filtersImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -35)
        ].forEach { $0.isActive = true }
    }
    
    private func configureSelectCategoryLabelConstraints() {
        [
            selectCategoryLabel.topAnchor.constraint(equalTo: geolocaionLabel.bottomAnchor, constant: 18),
            selectCategoryLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17)
        ].forEach { $0.isActive = true }
    }
    
    private func configureViewAllLabelConstraints() {
        [
            viewAllLabel.centerYAnchor.constraint(equalTo: selectCategoryLabel.centerYAnchor),
            viewAllLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -33)
        ].forEach { $0.isActive = true }
    }
    
    private func configureCategoriesCollectionViewConstraints() {
        [
            categoriesCollectionView.topAnchor.constraint(equalTo: selectCategoryLabel.bottomAnchor, constant: 24),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 93)
        ].forEach { $0.isActive = true }
    }
    
    private func configureSearchStackViewConstraints() {
        [
            searchStackView.heightAnchor.constraint(equalToConstant: 34),
            searchStackView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 35),
            searchStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            searchStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32)
        ].forEach { $0.isActive = true }
    }
    
    private func configureHotSalesViewConstraints() {
        [
            hotSalesView.topAnchor.constraint(equalTo: searchStackView.bottomAnchor, constant: 24),
            hotSalesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hotSalesView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hotSalesView.heightAnchor.constraint(equalToConstant: 180)
        ].forEach { $0.isActive = true }
    }
    
}

//MARK: Adding HotSalesView

extension AllProductsView {
    
    func initializeHotSalesView(hotSalesPhones: [HotSalesPhone]) {
        hotSalesView.configureHotSalesScrollView(hotSalesPhones: hotSalesPhones)
    }
}
