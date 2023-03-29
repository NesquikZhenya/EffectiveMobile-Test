//
//  ProductDetailsDataConverter.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 29.03.2023.
//

import Foundation
import UIKit

class ProductDetailsDataConverter {
    
    let productDetailsDataFetcher = ProductDetailsDataFetcher()
    
    func convertProductData(productId: Int32, convertCompletion: @escaping (DetailedProduct) -> ()?) {
        
        let fetchCompletion = { (productData: DetailedProductDataModel) in
            
            let detailedProduct = DetailedProduct (CPU: productData.CPU, camera: productData.camera, capacity: productData.capacity, colors: self.colorsFromString(array: productData.color), id: Int(productData.id)!, images: self.urlsFromString(array: productData.images), isFavorites: productData.isFavorites, price: productData.price, rating: productData.rating, sd: productData.sd, ssd: productData.ssd, title: productData.title)
            
            convertCompletion(detailedProduct)
            
        }
        
        productDetailsDataFetcher.fetchProduct(productId: productId, fetchCompletion: fetchCompletion)
        
    }
}

extension ProductDetailsDataConverter {
    
    func colorsFromString(array: [String]) -> [UIColor] {
        var colors: [UIColor] = []
        for string in array {
            colors.append(self.hexStringToUIColor(hex: string))
        }
        return colors
    }
    
    func urlsFromString(array: [String]) -> [URL] {
        var images: [URL] = []
        for string in array {
            images.append(URL(string: string)!)
        }
        return images
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}
