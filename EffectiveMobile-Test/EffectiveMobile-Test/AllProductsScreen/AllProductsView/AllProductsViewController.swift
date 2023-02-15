//
//  AllProductsViewController.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 05.12.2022.
//

import UIKit

protocol AllProductsViewModelListening: AnyObject {
    func initializeHotSalesView(hotSalesPhones: [HotSalesPhone])
    func initializeBestSellerCollectionView(bestSellerPhones: [BestSellerPhone])

}


class AllProductsViewController: UIViewController {
    
    private var allProductsViewModel: AllProductsViewModel
        
    let allProductsView = AllProductsView()
    
    func dodo(hotSalesPhones: [HotSalesPhone]) {
        self.allProductsView.initializeHotSalesView(hotSalesPhones: hotSalesPhones)
    }
    
    init(allProductsViewModel: AllProductsViewModel = AllProductsViewModel()) {
        self.allProductsViewModel = allProductsViewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = allProductsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        allProductsViewModel.delegate = self
        allProductsView.categoriesCollectionView.dataSource = self
        allProductsView.categoriesCollectionView.delegate = self
        allProductsView.categoriesCollectionView.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        allProductsViewModel.getHotSalesPhones()
        allProductsViewModel.getBestSellerPhones()
    }
    
}

//MARK: delegate protocol conforming

extension AllProductsViewController: AllProductsViewModelListening {
    
    func initializeHotSalesView(hotSalesPhones: [HotSalesPhone]) {
        DispatchQueue.main.async {
            self.allProductsView.initializeHotSalesView(hotSalesPhones: hotSalesPhones)
        }
    }
    func initializeBestSellerCollectionView(bestSellerPhones: [BestSellerPhone]) {
        DispatchQueue.main.async {
            self.allProductsView.initializeBestSellerView(bestSellerPhones: bestSellerPhones)
        }
    }
    
}

//MARK: CollectionView Configuration

extension AllProductsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allProductsViewModel.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = allProductsView.categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath) as? CategoriesCollectionViewCell {
            cell.configureCategory(name: allProductsViewModel.categories[indexPath.row].name, imageName: allProductsViewModel.categories[indexPath.row].imageName, isSelected: allProductsViewModel.categories[indexPath.row].isSelected)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        allProductsViewModel.categoryDidTap(newSelectedId: indexPath.row)
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
