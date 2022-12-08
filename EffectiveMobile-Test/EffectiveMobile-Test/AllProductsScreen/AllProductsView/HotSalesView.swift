//
//  HotSalesView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 08.12.2022.
//

import UIKit

class HotSalesView: UIView {

    private let hotSalesLabel: UILabel = {
        let label = UILabel()
        label.text = "Hot Sales"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        return label
    }()
    
    private let seeMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "see more"
        label.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 15)
        return label
    }()
    
    lazy var hotSalesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        loadViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HotSalesView: ViewSetuping {

    func loadViews() {
        [
            hotSalesLabel,
            seeMoreLabel,
            hotSalesCollectionView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureHotSalesLabelConstraints()
        configureSeeMoreLabelConstraints()
        configureHotSalesCollectionViewConstraints()
        
        [
            hotSalesLabel,
            seeMoreLabel,
            hotSalesCollectionView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureHotSalesLabelConstraints() {
        [
            hotSalesLabel.topAnchor.constraint(equalTo: self.topAnchor),
            hotSalesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17)
        ].forEach { $0.isActive = true }
    }
    
    private func configureSeeMoreLabelConstraints() {
        [
            seeMoreLabel.centerYAnchor.constraint(equalTo: hotSalesLabel.centerYAnchor),
            seeMoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27)
        ].forEach { $0.isActive = true }
    }
    
    
    private func configureHotSalesCollectionViewConstraints() {
        [
            hotSalesCollectionView.topAnchor.constraint(equalTo: hotSalesLabel.bottomAnchor, constant: 8),
            hotSalesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hotSalesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hotSalesCollectionView.heightAnchor.constraint(equalToConstant: 180)
        ].forEach { $0.isActive = true }
    }
    
}

