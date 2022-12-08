//
//  SearchView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 07.12.2022.
//

import UIKit

class SearchView: UIView {
    
    private let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "search")
        return imageView
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.font = UIFont(name: "MarkPro-Regular", size: 12)
        textField.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 0.5)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 17
        loadViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SearchView: ViewSetuping {
    
    func loadViews() {
        [
            searchImageView,
            searchTextField
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureSearchImageViewConstraints()
        configureSearchTextFieldConstraints()
        
        [
            searchImageView,
            searchTextField
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureSearchImageViewConstraints() {
        [
            searchImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            searchImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            searchImageView.widthAnchor.constraint(equalToConstant: 16)
        ].forEach { $0.isActive = true }
    }
    
    private func configureSearchTextFieldConstraints(){
        [
            searchTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: searchImageView.trailingAnchor, constant: 8),
            searchTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ].forEach { $0.isActive = true }
    }
    
}
