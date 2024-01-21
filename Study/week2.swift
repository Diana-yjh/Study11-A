//
//  week2.swift
//  Study
//
//  Created by H on 1/14/24.
//

import Foundation

struct Shop {
    private var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    var productsCount: Int {
        return self.productsList.count
    }
    
    mutating func sell(productNumber: Int) -> Bool {
        if let safeProduct = self.productsList[productNumber] {
            print("\(productNumber)번 상품은 존재하는 상품입니다.")
            self.productsList[productNumber] = nil
            return true // 거래 완료
        }
        
        print("\(productNumber)번 상품은 존재하지 않는 상품입니다.")
        return false // 거래 실패
    }
}

struct Camper {
    var budget: Int
    
    mutating func buy(shop: inout Shop, productNumber: Int) {
        print("\(productNumber)번 상품을 선택했습니다.")
        
        if budget <= 0 {
            print("예산이 초과되었습니다.")
            print("------------------------------")
            return
        }
        
        if shop.sell(productNumber: productNumber) {
            self.budget -= 1000
            print("\(productNumber)번 상품을 구매했습니다. (현재 예산: \(budget))")
        } else {
            print("\(productNumber)번 상품을 구매할 수 없습니다. (현재 예산: \(budget))")
        }
        print("------------------------------")
    }
}
