//
//  FavouritesButtonView.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 03.04.2023.
//

import UIKit

class FavouritesButtonView: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

}
