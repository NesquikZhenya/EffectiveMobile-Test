//
//  HotSalesData.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 10.12.2022.
//

import Foundation

struct HotSalesPhone {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool
}

struct HotSalesData {
    let hotSalesPhones: [HotSalesPhone] = [
        HotSalesPhone(id: 1, isNew: true, title: "Iphone 12", subtitle: "Súper. Mega. Rápido.", picture: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both", isBuy: true),
        HotSalesPhone(id: 2, isNew: nil, title: "Samsung Galaxy A71", subtitle: "Súper. Mega. Rápido.", picture: "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg", isBuy: true),
        HotSalesPhone(id: 3, isNew: nil, title: "Xiaomi Mi 11 ultra", subtitle: "Súper. Mega. Rápido.", picture: "https://static.digit.in/default/942998b8b4d3554a6259aeb1a0124384dbe0d4d5.jpeg", isBuy: true)
    ]
}
