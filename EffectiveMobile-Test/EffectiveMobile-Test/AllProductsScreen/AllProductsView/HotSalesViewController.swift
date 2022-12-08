//
//  HotSalesViewController.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 08.12.2022.
//

import UIKit

class HotSalesViewController: UIViewController {

    let hotSalesView = HotSalesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = hotSalesView
        hotSalesView.hotSalesCollectionView.dataSource = self
        hotSalesView.hotSalesCollectionView.delegate = self
        hotSalesView.hotSalesCollectionView.register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: "HotSalesCollectionViewCell")
    }

}

extension HotSalesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = hotSalesView.hotSalesCollectionView.dequeueReusableCell(withReuseIdentifier: "HotSalesCollectionViewCell", for: indexPath) as? HotSalesCollectionViewCell {
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 32, height: 180)
//        return CGSize(width: 200, height: collectionView.frame.height)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    
}
