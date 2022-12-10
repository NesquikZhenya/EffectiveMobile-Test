//
//  HotSalesPhoneView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 09.12.2022.
//

import UIKit

class HotSalesPhoneView: UIView {
    
    private let phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iphone12")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "ABCDE"
        label.textColor = .green
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
    
}

//MARK: Configurating constraints

extension HotSalesPhoneView: ViewSetuping {
    
    func loadViews() {
        [
            phoneImageView,
            phoneLabel
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configurePhoneImageViewConstraints()
        configurePhoneLabelConstraints()
        
        [
            phoneImageView,
            phoneLabel
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configurePhoneImageViewConstraints() {
        [
            phoneImageView.topAnchor.constraint(equalTo: self.topAnchor),
            phoneImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            phoneImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            phoneImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configurePhoneLabelConstraints() {
        [
            phoneLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            phoneLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ].forEach { $0.isActive = true }
    }
}

//MARK: Configurating View

extension HotSalesPhoneView {
    
    func configureHotSalesPhone() {
        
    }
    
}
