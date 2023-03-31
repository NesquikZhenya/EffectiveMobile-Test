//
//  ProductInfoShopColorButton.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 01.04.2023.
//

import UIKit

class ProductInfoShopColorButton: UIButton {

    private var id: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.widthAnchor.constraint(equalToConstant: 40).isActive = true
        self.layer.cornerRadius = 20
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

}

extension ProductInfoShopColorButton {
    
    func configureButton(id: Int, color: UIColor) {
        self.id = id
        self.backgroundColor = color
        self.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
    }
    
}
