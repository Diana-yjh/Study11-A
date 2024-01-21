//
//  main.swift
//  Study
//
//  Created by H on 1/14/24.
//

import Foundation

/// 1주차
//printProductsList()
//buyRandomly()

/// 2주차 - Type
var firstShop = Shop()
var secondShop = Shop()
var camper = Camper(budget: 4000)

print("1️⃣ First Shop (현재 예산: \(camper.budget))")
for _ in 0..<3 {
    camper.buy(shop: &firstShop, productNumber: Int.random(in: 0..<firstShop.productsCount))
}

print("2️⃣ Second Shop (현재 예산: \(camper.budget))")
for _ in 0..<3 {
    camper.buy(shop: &secondShop, productNumber: Int.random(in: 0..<secondShop.productsCount))
}
