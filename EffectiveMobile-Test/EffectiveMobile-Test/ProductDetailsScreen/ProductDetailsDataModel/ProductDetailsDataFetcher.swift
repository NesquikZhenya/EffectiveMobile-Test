//
//  ProductDetailsDataFetcher.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 29.03.2023.
//

import Foundation

final class ProductDetailsDataFetcher {
    
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
            case 1: return URL(string: "https://mocki.io/v1/5cd6a520-135f-44e8-b822-43ef63cbf686")!
            case 2: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            case 3: return URL(string: "https://mocki.io/v1/c1d521db-3b82-4819-989c-90267ec94448")!
            case 111: return URL(string: "https://mocki.io/v1/bc057ddb-6d08-4031-850d-b98b3bbedf94")!
            case 222: return URL(string: "https://mocki.io/v1/2683972a-c447-4ad0-a549-d416e1392f95")!
            case 333: return URL(string: "https://mocki.io/v1/13899feb-7a52-4925-94c4-7de238ade3df")!
            case 444: return URL(string: "https://mocki.io/v1/cd878f13-00cc-4de7-aa59-b8cff61afd89")!
            default: return URL(string: "https://mocki.io/v1/5cd6a520-135f-44e8-b822-43ef63cbf686")!
        }
    }
    
}
