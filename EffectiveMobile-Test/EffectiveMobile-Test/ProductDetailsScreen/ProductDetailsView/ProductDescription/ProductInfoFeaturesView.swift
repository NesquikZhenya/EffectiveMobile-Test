//
//  ProductInfoFeaturesView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 26.03.2023.
//

import UIKit

final class ProductInfoFeaturesView: UIView {

    private let featuresLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 16)
        label.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        label.numberOfLines = 0
        label.text = "Here could be any type of Product Details Features. Right now this view exists just to show functionality of this chapter."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        setupConstraints()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

}

extension ProductInfoFeaturesView: ViewSetuping {
  
    func loadViews() {
        [
            featuresLabel,
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureFeaturesLabelConstraints()
        
        [
            featuresLabel,
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureFeaturesLabelConstraints() {
        [
            featuresLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            featuresLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            featuresLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            featuresLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
}
