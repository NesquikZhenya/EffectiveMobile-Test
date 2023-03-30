//
//  AllProductsDataFetcher.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 13.02.2023.
//

import Foundation

final class AllProductsDataFetcher {
    
    func fetchAllProductsData(fetchCompletion: @escaping (AllProductsDataModel) -> ()?) {
        let allProductsURL = URL(string: "https://mocki.io/v1/01778141-24c0-4344-8b23-4b79130950e3")!
        let allProductsFetchTask = URLSession.shared.dataTask(with: allProductsURL) { data, response, error in
            if let data = data {
                guard let allProductsData = try? JSONDecoder().decode(AllProductsDataModel.self, from: data) else {
                    return
                }
                fetchCompletion(allProductsData)
            }
        }
        allProductsFetchTask.resume()
    }

}
