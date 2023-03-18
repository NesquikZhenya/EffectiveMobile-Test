//
//  ViewSetuping.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 08.12.2022.
//

import Foundation
import UIKit

protocol ViewSetuping {
    func loadViews()
    func setupConstraints()
}

extension UIImageView {
    func downloaded(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if data?.count ?? 0 > 1000 {
                let image = UIImage(data: data ?? Data())
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            } else {
                let image = UIImage(named: "noImg")
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                }
            }
        }.resume()
    }
}
