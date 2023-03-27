//
//  ProductRatingView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 24.03.2023.
//

import UIKit

class ProductRatingView: UIView {
    
    private let firstStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.isHidden = true
        return imageView
    }()
    
    private let secondStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.isHidden = true
        return imageView
    }()
    
    private let thirdStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.isHidden = true
        return imageView
    }()
    
    private let fourthStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.isHidden = true
        return imageView
    }()
    
    private let fithStarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star")
        imageView.isHidden = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        setupConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ProductRatingView: ViewSetuping {
    
    func loadViews() {
        [
            firstStarImageView,
            secondStarImageView,
            thirdStarImageView,
            fourthStarImageView,
            fithStarImageView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureFirstStarImageViewConstraints()
        configureSecondStarImageViewConstraints()
        configureThirdStarImageViewConstraints()
        configureFourthStarImageViewConstraints()
        configureFithStarImageViewConstraints()
        
        [
            firstStarImageView,
            secondStarImageView,
            thirdStarImageView,
            fourthStarImageView,
            fithStarImageView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureFirstStarImageViewConstraints() {
        [
            firstStarImageView.topAnchor.constraint(equalTo: self.topAnchor),
            firstStarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstStarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureSecondStarImageViewConstraints() {
        [
            secondStarImageView.topAnchor.constraint(equalTo: self.topAnchor),
            secondStarImageView.leadingAnchor.constraint(equalTo: firstStarImageView.trailingAnchor, constant: 9),
            secondStarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureThirdStarImageViewConstraints() {
        [
            thirdStarImageView.topAnchor.constraint(equalTo: self.topAnchor),
            thirdStarImageView.leadingAnchor.constraint(equalTo: secondStarImageView.trailingAnchor, constant: 9),
            thirdStarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureFourthStarImageViewConstraints() {
        [
            fourthStarImageView.topAnchor.constraint(equalTo: self.topAnchor),
            fourthStarImageView.leadingAnchor.constraint(equalTo: thirdStarImageView.trailingAnchor, constant: 9),
            fourthStarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureFithStarImageViewConstraints() {
        [
            fithStarImageView.topAnchor.constraint(equalTo: self.topAnchor),
            fithStarImageView.leadingAnchor.constraint(equalTo: fourthStarImageView.trailingAnchor, constant: 9),
            fithStarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
}

extension ProductRatingView {
    
    func configureView(rating: Double) {
        switch lround(rating) {
        case 1: firstStarImageView.isHidden = false
        case 2: [firstStarImageView, secondStarImageView].forEach { $0.isHidden = false }
        case 3: [firstStarImageView, secondStarImageView, thirdStarImageView].forEach { $0.isHidden = false }
        case 4: [firstStarImageView, secondStarImageView, thirdStarImageView, fourthStarImageView].forEach { $0.isHidden = false }
        case 5: [firstStarImageView, secondStarImageView, thirdStarImageView, fourthStarImageView, fithStarImageView].forEach { $0.isHidden = false }
        default: break
        }
    }
}
