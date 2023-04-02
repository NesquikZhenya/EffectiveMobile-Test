//
//  ProductInfoShopCapacityButton.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 01.04.2023.
//

import UIKit

class ProductInfoShopCapacityButton: UIButton {

    var id: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 13)
        self.setTitleColor(UIColor(red: 0.554, green: 0.554, blue: 0.554, alpha: 1), for: .normal)
        self.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

}

extension ProductInfoShopCapacityButton {
    
    func configureButton(id:Int, capacity: String) {
        self.id = id
        self.setTitle("\(capacity) GB", for: .normal)
    }
    
}
