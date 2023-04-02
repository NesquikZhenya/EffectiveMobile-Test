//
//  CartButtonView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 26.03.2023.
//

import UIKit

protocol FirstRemovedListening: AnyObject {
    func firstRemoved()
}


final class CartButtonView: UIView {
    
    weak var delegate: FirstRemovedListening?
    
    private var amount: Int = 0
    private var price: Int = 0

    private let addToCartLabel: UILabel = {
        let label = UILabel()
        label.text = "Add to Cart"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 20)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 20)
        return label
    }()
    
    lazy var lessLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 30)
        label.isHidden = true
        label.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(lessTapped))
        label.addGestureRecognizer(gesture)
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 20)
        label.isHidden = true
        return label
    }()
    
    lazy var moreLabel: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 30)
        label.isHidden = true
        label.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(moreTapped))
        label.addGestureRecognizer(gesture)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.heightAnchor.constraint(equalToConstant: 54).isActive = true
        self.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        self.layer.cornerRadius = 10
        self.alpha = 0.6
        self.isUserInteractionEnabled = false
        loadViews()
        setupConstraints()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension CartButtonView: ViewSetuping {
    
    func loadViews() {
        [
            addToCartLabel,
            priceLabel,
            lessLabel,
            amountLabel,
            moreLabel
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureAddToCartLabelConstraints()
        configurePriceLabelConstraints()
        configureLessLabelConstraints()
        configureAmountLabelConstraints()
        configureMoreLabelConstraints()
        
        [
            addToCartLabel,
            priceLabel,
            lessLabel,
            amountLabel,
            moreLabel
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureAddToCartLabelConstraints() {
        [
            addToCartLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            addToCartLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configurePriceLabelConstraints() {
        [
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            priceLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureLessLabelConstraints() {
        [
            lessLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 64),
            lessLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -1)
        ].forEach { $0.isActive = true }
    }
    
    private func configureAmountLabelConstraints() {
        [
            amountLabel.leadingAnchor.constraint(equalTo: lessLabel.leadingAnchor, constant: 32),
            amountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ].forEach { $0.isActive = true }
    }
    
    private func configureMoreLabelConstraints() {
        [
            moreLabel.leadingAnchor.constraint(equalTo: amountLabel.leadingAnchor, constant: 32),
            moreLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -1)
        ].forEach { $0.isActive = true }
    }
    
}

extension CartButtonView {
    
    func initializeView(price: Int) {
        self.price = price
        priceLabel.text = "$\(priceRefactored(price: price)).00"
    }
    
    private func priceRefactored(price: Int) -> String {
        if price < 1000 {
            return "\(price)"
        } else {
                return (String(price).prefix(1) + "," + String(price).suffix(3))
        }
    }
    
    func firstAdded() {
        amount += 1
        addToCartLabel.isHidden = true
        amountLabel.text = "\(amount)"
        [lessLabel, amountLabel, moreLabel].forEach { $0.isHidden = false }
    }
    
    @objc private func lessTapped() {
        amount -= 1
        amountLabel.text = "\(amount)"
        if amount != 0 {
            priceLabel.text = "$\(priceRefactored(price: price * amount)).00"
        } else {
            [lessLabel, amountLabel, moreLabel].forEach { $0.isHidden = true }
            addToCartLabel.isHidden = false
        }
        delegate?.firstRemoved()
    }
    
    @objc private func moreTapped() {
        amount += 1
        amountLabel.text = "\(amount)"
        priceLabel.text = "$\(priceRefactored(price: price * amount)).00"
    }
    
}
