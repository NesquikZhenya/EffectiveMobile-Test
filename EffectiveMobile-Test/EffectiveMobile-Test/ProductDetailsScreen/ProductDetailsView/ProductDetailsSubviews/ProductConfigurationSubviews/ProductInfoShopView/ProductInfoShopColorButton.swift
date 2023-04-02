//
//  ProductInfoShopColorButton.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 03.04.2023.
//

import UIKit

class ProductInfoShopColorButton: UIButton {

    var id: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 20
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.alpha = 0.6
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

}


extension ProductInfoShopColorButton {
    
    func configureButton(id:Int, color: UIColor) {
        self.id = id
        self.backgroundColor = color
    }

}
