//
//  ProductInfoDetailsView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 26.03.2023.
//

import UIKit

final class ProductInfoDetailsView: UIView {

    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 16)
        label.textColor = UIColor(red: 0.554, green: 0.554, blue: 0.554, alpha: 1)
        label.numberOfLines = 0
        label.text = "Here could be any type of Product Details Description. Right now this view exists just to show functionality of this chapter."
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

extension ProductInfoDetailsView: ViewSetuping {
  
    func loadViews() {
        [
            detailsLabel,
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureDetailsLabelConstraints()
        
        [
            detailsLabel,
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureDetailsLabelConstraints() {
        [
            detailsLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            detailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            detailsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            detailsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
}
