//
//  AllProductsDataFetcher.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 13.02.2023.
//

import Foundation
import UIKit

class AllProductsDataFetcher {
    
    func fetchAllProductsData(fetchCompletion: @escaping (AllProductsDataModel?) -> ()?) {
        let allProductsURL = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175")!
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
