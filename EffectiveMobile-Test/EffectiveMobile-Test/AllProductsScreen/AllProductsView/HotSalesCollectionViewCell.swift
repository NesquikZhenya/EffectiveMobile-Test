//
//  HotSalesCollectionViewCell.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 08.12.2022.
//

import UIKit

class HotSalesCollectionViewCell: UICollectionViewCell {
    
    private let phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iphone12")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        loadViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HotSalesCollectionViewCell: ViewSetuping {
    
    func loadViews() {
        [
            phoneImageView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configurePhoneImageViewConstraints()
        
        [
            phoneImageView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configurePhoneImageViewConstraints() {
        [
            phoneImageView.topAnchor.constraint(equalTo: self.topAnchor),
            phoneImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            phoneImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            phoneImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
}
