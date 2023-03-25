//
//  ProductDetailsViewController.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 22.03.2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    let productDetailsView = ProductDetailsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = productDetailsView
    }
    

}
