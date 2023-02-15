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
    
    private let newTagView: UIView = {
        let view = UIView()
        let label = UILabel()
        label.text = "New"
        label.textColor = .white
        label.font = UIFont(name: "MarkPro-Bold", size: 10)
        label.font = label.font.withSize(10)
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        view.layer.cornerRadius = 13.5
        return view
    }()
    
    private let phoneNameLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone 12"
        label.textColor = .white
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.font = label.font.withSize(25)
        return label
    }()
    
    private let phoneSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Super. Mega. Rapido"
        label.textColor = .white
        label.font = UIFont(name: "MarkPro-Regular", size: 11)
        label.font = label.font.withSize(11)
        return label
    }()
    
    private let buyNowButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy Now", for: .normal)
        button.setTitleColor(UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 11)
        return button
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
            newTagView,
            phoneNameLabel,
            phoneSubtitleLabel,
            buyNowButton
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configurePhoneImageViewConstraints()
        configureNewTagViewConstraints()
        configurePhoneNameLabelConstraints()
        configurePhoneSubtitleLabelConstraints()
        configureBuyNowButtonConstraints()
        
        
        [
            phoneImageView,
            newTagView,
            phoneNameLabel,
            phoneSubtitleLabel,
            buyNowButton
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
    
    private func configureNewTagViewConstraints() {
        [
            newTagView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            newTagView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            newTagView.widthAnchor.constraint(equalToConstant: 27),
            newTagView.heightAnchor.constraint(equalToConstant: 27)
        ].forEach { $0.isActive = true }
    }
    
    private func configurePhoneNameLabelConstraints() {
        [
            phoneNameLabel.topAnchor.constraint(equalTo: newTagView.bottomAnchor, constant: 18),
            phoneNameLabel.leadingAnchor.constraint(equalTo: newTagView.leadingAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configurePhoneSubtitleLabelConstraints() {
        [
            phoneSubtitleLabel.topAnchor.constraint(equalTo: phoneNameLabel.bottomAnchor, constant: 5),
            phoneSubtitleLabel.leadingAnchor.constraint(equalTo: phoneNameLabel.leadingAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureBuyNowButtonConstraints() {
        [
            buyNowButton.topAnchor.constraint(equalTo: phoneSubtitleLabel.bottomAnchor, constant: 26),
            buyNowButton.leadingAnchor.constraint(equalTo: phoneSubtitleLabel.leadingAnchor),
            buyNowButton.heightAnchor.constraint(equalToConstant: 23),
            buyNowButton.widthAnchor.constraint(equalToConstant: 98),
            buyNowButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -26)
        ].forEach { $0.isActive = true }
    }
    
}

//MARK: Configurating View

extension HotSalesPhoneView {
    
    func configureHotSalesPhone(hotSalesPhone: HotSalesPhone) {
        newTagView.isHidden = !(hotSalesPhone.isNew ?? false)
        phoneNameLabel.text = hotSalesPhone.title
        phoneSubtitleLabel.text = hotSalesPhone.subtitle
        phoneImageView.downloaded(from: hotSalesPhone.picture)
    }
    
}

extension UIImageView {
    func downloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
}
