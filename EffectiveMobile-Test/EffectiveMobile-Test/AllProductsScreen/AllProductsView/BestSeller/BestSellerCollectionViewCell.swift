//
//  BestSellerCollectionViewCell.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 15.02.2023.
//

import UIKit

protocol FavouritesChangeListening: AnyObject {
    func favouritesDidTap(cellIndexPath: IndexPath)
}

class BestSellerCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: FavouritesChangeListening?
    
    private var cellIndexPath: IndexPath = IndexPath()
    
    private var phoneImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var priceAfterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 16)
        label.font = label.font.withSize(16)
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        return label
    }()
    
    private var priceBeforeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 10)
        label.font = label.font.withSize(10)
        label.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        return label
    }()
    
    private var phoneNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Refular", size: 10)
        label.font = label.font.withSize(10)
        return label
    }()
    
    private let favouritesView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12.5
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 20
        return view
    }()
    
    private let favouritesImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        loadViews()
        setupConstraints()
        favouritesView.addGestureRecognizer(favouritesGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurePhone (bestSellerPhone: BestSellerPhone, cellIndexPath: IndexPath) {
        self.cellIndexPath = cellIndexPath
        phoneImageView.downloaded(from: bestSellerPhone.picture)
        phoneNameLabel.text = bestSellerPhone.title
        priceBeforeLabel.text = priceRefactored(price: bestSellerPhone.discountPrice)
        priceAfterLabel.text = priceRefactored(price: bestSellerPhone.priceWithoutDiscount)
        
        if bestSellerPhone.isFavorites {
            favouritesImageView.image = UIImage(named: "favourite")
        } else {
            favouritesImageView.image = UIImage(named: "notFavourite")
        }
        
    }
    
    lazy var favouritesGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(favouritesDidTap))
    
    @objc func favouritesDidTap() {
        delegate?.favouritesDidTap(cellIndexPath: self.cellIndexPath)
    }
    
    private func priceRefactored(price: Int32) -> String {
        if price < 1000 {
            return "\(price)"
        } else {
                return (String(price).prefix(1) + "," + String(price).suffix(3))
        }
    }
}

//MARK: Configurating constraints

extension BestSellerCollectionViewCell: ViewSetuping {
    
    func loadViews() {
        [
            phoneImageView,
            priceAfterLabel,
            priceBeforeLabel,
            phoneNameLabel,
            favouritesView,
            favouritesImageView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configurePhoneImageViewConstraints()
        configurePriceAfterLabelConstraints()
        configurePriceBeforeLabelConstraints()
        configurePhoneNameLabelConstraints()
        configureFavouritesViewConstraints()
        configureFavouritesImageViewConstraints()
        
        
        [
            phoneImageView,
            priceAfterLabel,
            priceBeforeLabel,
            phoneNameLabel,
            favouritesView,
            favouritesImageView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configurePhoneImageViewConstraints() {
        [
            phoneImageView.topAnchor.constraint(equalTo: self.topAnchor),
            phoneImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            phoneImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            phoneImageView.heightAnchor.constraint(equalTo: self.widthAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configurePriceAfterLabelConstraints() {
        [
            priceAfterLabel.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor, constant: 2),
            priceAfterLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21)
        ].forEach { $0.isActive = true }
    }
    
    private func configurePriceBeforeLabelConstraints() {
        [
            priceBeforeLabel.topAnchor.constraint(equalTo: phoneImageView.bottomAnchor, constant: 8),
            priceBeforeLabel.leadingAnchor.constraint(equalTo: priceAfterLabel.trailingAnchor, constant: 7),
            priceBeforeLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -16)
        ].forEach { $0.isActive = true }
    }
    
    private func configurePhoneNameLabelConstraints() {
        [
            phoneNameLabel.topAnchor.constraint(equalTo: priceAfterLabel.bottomAnchor, constant: 5),
            phoneNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 21),
            phoneNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -16),
            phoneNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ].forEach { $0.isActive = true }
    }
    
    private func configureFavouritesViewConstraints() {
        [
            favouritesView.topAnchor.constraint(equalTo: self.topAnchor, constant: 11),
            favouritesView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            favouritesView.widthAnchor.constraint(equalToConstant: 25),
            favouritesView.heightAnchor.constraint(equalToConstant: 25)
        ].forEach { $0.isActive = true }
    }
    
    private func configureFavouritesImageViewConstraints() {
        [
            favouritesImageView.centerXAnchor.constraint(equalTo: favouritesView.centerXAnchor),
            favouritesImageView.centerYAnchor.constraint(equalTo: favouritesView.centerYAnchor),
        ].forEach { $0.isActive = true }
    }
    
    
}
