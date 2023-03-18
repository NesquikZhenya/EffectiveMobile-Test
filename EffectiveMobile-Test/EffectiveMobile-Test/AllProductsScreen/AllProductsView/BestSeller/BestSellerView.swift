//
//  BestSellerView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 15.02.2023.
//

import UIKit

protocol HotSalesViewHiding: AnyObject {
    
    var isNowHidden: Bool { get set }

}

protocol FavouritesUpdating: AnyObject {
    
    func updateFavourite(bestSellerPhone: BestSellerPhone)

}

class BestSellerView: UIView {
    
    weak var delegate: HotSalesViewHiding?
    
    weak var updateDelegate: FavouritesUpdating?
    
    private var bestSellerPhones: [BestSellerPhone] = []
    
    private let bestSellerLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Seller"
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        label.font = label.font.withSize(25)
        return label
    }()
    
    private let seeMoreLabel: UILabel = {
        let label = UILabel()
        label.text = "see more"
        label.textColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        label.font = UIFont(name: "MarkPro-Regular", size: 15)
        label.font = label.font.withSize(15)
        return label
    }()
    
    lazy var bestSellerCollectionView: UICollectionView = {
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
        bestSellerCollectionView.dataSource = self
        bestSellerCollectionView.delegate = self
        bestSellerCollectionView.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "BestSellerCollectionViewCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: Configurating constraints

extension BestSellerView: ViewSetuping {

    func loadViews() {
        [
            bestSellerLabel,
            seeMoreLabel,
            bestSellerCollectionView
        ].forEach {self.addSubview($0)}
    }
    
    func setupConstraints() {
        configureBestSellerLabelConstraints()
        configureSeeMoreLabelConstraints()
        configureBestSellerCollectionViewConstraints()
        
        [
            bestSellerLabel,
            seeMoreLabel,
            bestSellerCollectionView
        ].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func configureBestSellerLabelConstraints() {
        [
            bestSellerLabel.topAnchor.constraint(equalTo: self.topAnchor),
            bestSellerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 17)
        ].forEach { $0.isActive = true }
    }
    
    private func configureSeeMoreLabelConstraints() {
        [
            seeMoreLabel.centerYAnchor.constraint(equalTo: bestSellerLabel.centerYAnchor),
            seeMoreLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27)
        ].forEach { $0.isActive = true }
    }
    
    private func configureBestSellerCollectionViewConstraints() {
        [
            bestSellerCollectionView.topAnchor.constraint(equalTo: bestSellerLabel.bottomAnchor, constant: 8),
            bestSellerCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            bestSellerCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            bestSellerCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
}

extension BestSellerView {
    func configureBestSellerCollectionView(bestSellerPhones: [BestSellerPhone]){
        self.bestSellerPhones = bestSellerPhones
        bestSellerCollectionView.reloadData()
    }
}

extension BestSellerView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellerPhones.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = bestSellerCollectionView.dequeueReusableCell(withReuseIdentifier: "BestSellerCollectionViewCell", for: indexPath) as? BestSellerCollectionViewCell {
            cell.configurePhone(bestSellerPhone: bestSellerPhones[indexPath.row], cellIndexPath: indexPath)
            cell.delegate = self
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((UIScreen.main.bounds.width - 16*3)/2), height: (((UIScreen.main.bounds.width - 16*3)/2)+55))
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if delegate != nil {
            if scrollView.contentOffset.y > 0 && !delegate!.isNowHidden {
                UIView.animate(withDuration: 0.5) {
                    self.delegate?.isNowHidden = true
                }
            } else if scrollView.contentOffset.y <= 0 && delegate!.isNowHidden {
                UIView.animate(withDuration: 0.5) {
                    self.delegate?.isNowHidden = false
                }
            }
        }
    }
    
}

extension BestSellerView: FavouritesChangeListening {
    func favouritesDidTap(cellIndexPath: IndexPath) {
        self.bestSellerPhones[cellIndexPath.row].isFavorites.toggle()
        self.bestSellerCollectionView.reloadItems(at: [cellIndexPath])
        updateDelegate?.updateFavourite(bestSellerPhone: bestSellerPhones[cellIndexPath.row])
    }
}
