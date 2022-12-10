//
//  HotSalesDataProvider.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 10.12.2022.
//

import Foundation

protocol HotSalesDataProviding {
    
    func getHotSalesPhones() -> [HotSalesPhone]
    
}

struct HotSalesDataProvider: HotSalesDataProviding {
    
    var hotSalesData = HotSalesData()
            
    func getHotSalesPhones() -> [HotSalesPhone] {
        return hotSalesData.hotSalesPhones
    }
    
}
