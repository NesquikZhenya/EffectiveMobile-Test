//
//  FavouritesView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 17.02.2023.
//

import UIKit

class FavouritesView: UIView {

    private var favourites: [BestSellerPhone] = []
    
    private let favouritesLabel: UILabel = {
        let label = UILabel()
        label.text = "Favourites"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        return label
    }()
    
    
    lazy var favouritesCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(red: 0.971, green: 0.971, blue: 0.971, alpha: 1)
        loadViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: Configurating constraints

extension FavouritesView: ViewSetuping {

    func loadViews() {
        [
            favouritesLabel,
            favouritesCollectionView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureFavouritesLabelConstraints()
        configureFavouritesCollectionViewConstraints()
        
        [
            favouritesLabel,
            favouritesCollectionView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureFavouritesLabelConstraints() {
        [
            favouritesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 64),
            favouritesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ].forEach { $0.isActive = true }
    }
    
    private func configureFavouritesCollectionViewConstraints() {
        [
            favouritesCollectionView.topAnchor.constraint(equalTo: favouritesLabel.bottomAnchor, constant: 8),
            favouritesCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            favouritesCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            favouritesCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
}
