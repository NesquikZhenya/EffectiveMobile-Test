//
//  ProductInfoDetailsView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 26.03.2023.
//

import UIKit

final class ProductInfoDetailsView: UIView {

    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "MarkPro-Medium", size: 16)
        textView.textColor = UIColor(red: 0.554, green: 0.554, blue: 0.554, alpha: 1)
        textView.text = "Here could be any type of Product Details Description. Right now this view exists just to show functionality of this chapter."
        return textView
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
            textView,
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureTextViewConstraints()
        
        [
            textView,
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureTextViewConstraints() {
        [
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
}
