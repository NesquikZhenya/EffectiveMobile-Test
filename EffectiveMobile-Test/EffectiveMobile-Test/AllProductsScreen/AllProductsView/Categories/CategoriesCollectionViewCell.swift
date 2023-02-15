//
//  CategoriesCollectionViewCell.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 07.12.2022.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    private let categoryBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35.5
        return view
    }()
    
    private var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 12)
        label.font = label.font.withSize(12)
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCategory (name: String, imageName: String, isSelected: Bool) {
        categoryNameLabel.text = name
        categoryImageView.image = UIImage(named: imageName)
        if isSelected {
            categoryImageView.tintColor = .white
            categoryBackgroundView.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
            categoryNameLabel.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        } else {
            categoryImageView.tintColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 0.3)
            categoryBackgroundView.backgroundColor = .white
            categoryNameLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)

        }
    }
}

//MARK: Configurating constraints

extension CategoriesCollectionViewCell: ViewSetuping {
    
    func loadViews() {
        [
            categoryBackgroundView,
            categoryImageView,
            categoryNameLabel
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureCategoryBackgroundViewConstraints()
        configureCategoryImageViewConstraints()
        configureCategoryNameLabelConstraints()
        
        [
            categoryBackgroundView,
            categoryImageView,
            categoryNameLabel
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureCategoryBackgroundViewConstraints() {
        [
            categoryBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            categoryBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            categoryBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureCategoryImageViewConstraints() {
        [
            categoryImageView.centerYAnchor.constraint(equalTo: categoryBackgroundView.centerYAnchor),
            categoryImageView.centerXAnchor.constraint(equalTo: categoryBackgroundView.centerXAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureCategoryNameLabelConstraints() {
        [
            categoryNameLabel.topAnchor.constraint(equalTo: categoryBackgroundView.bottomAnchor, constant: 7),
            categoryNameLabel.centerXAnchor.constraint(equalTo: categoryBackgroundView.centerXAnchor),
            categoryNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    
}
