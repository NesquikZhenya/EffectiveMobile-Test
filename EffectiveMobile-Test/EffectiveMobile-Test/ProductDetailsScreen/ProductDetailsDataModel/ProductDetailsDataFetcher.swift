//
//  ProductDetailsDataFetcher.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 29.03.2023.
//

import Foundation

class ProductDetailsDataFetcher {
    
    func fetchProduct(productId:Int32, fetchCompletion: @escaping (DetailedProductDataModel) -> ()?) {
        
        let productURL = urlForId(productId: productId)
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

extension ProductDetailsDataFetcher {
    
    func urlForId(productId: Int32) -> URL {
        switch productId {
            case 1: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            case 2: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            case 3: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            case 111: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            case 222: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            case 333: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            case 444: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            default: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
        }
    }
    
}
