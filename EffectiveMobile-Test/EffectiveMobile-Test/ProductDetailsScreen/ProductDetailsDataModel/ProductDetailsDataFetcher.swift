//
//  ProductDetailsDataFetcher.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 29.03.2023.
//

import Foundation

class ProductDetailsDataFetcher {
    
    func fetchProduct(fetchCompletion: @escaping (DetailedProductDataModel) -> ()?) {
        let productURL = URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
        let productFetchTask = URLSession.shared.dataTask(with: productURL) { data, response, error in
            if let data = data {
                guard let productData = try? JSONDecoder().decode(DetailedProductDataModel.self, from: data) else {
                    return
                }
                fetchCompletion(productData)
            }
        }
        productFetchTask.resume()
    }

}
