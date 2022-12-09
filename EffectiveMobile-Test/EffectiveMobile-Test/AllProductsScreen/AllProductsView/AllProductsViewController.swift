//
//  AllProductsViewController.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 05.12.2022.
//

import UIKit

class AllProductsViewController: UIViewController {
    
    var categoriesViewModel = CategoriesViewModel()
    let allProductsView = AllProductsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = allProductsView
        allProductsView.categoriesCollectionView.dataSource = self
        allProductsView.categoriesCollectionView.delegate = self
        allProductsView.categoriesCollectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        allProductsView.initializeHotSalesView2(hotSalesPhones: [HotSalesPhone(id: 1), HotSalesPhone(id: 2), HotSalesPhone(id: 3), HotSalesPhone(id: 4)])
    }
    
}

//MARK: CollectionView Configuration

extension AllProductsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = allProductsView.categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell {
            cell.configureCategory(name: categoriesViewModel.categories[indexPath.row].name, imageName: categoriesViewModel.categories[indexPath.row].imageName, isSelected: categoriesViewModel.categories[indexPath.row].isSelected)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categoriesViewModel.categories[categoriesViewModel.selectedCategory].isSelected.toggle()
        categoriesViewModel.categories[indexPath.row].isSelected.toggle()
        categoriesViewModel.selectedCategory = indexPath.row
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 71, height: 93)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 23
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 23, bottom: 0, right: 0)
    }
    
}
