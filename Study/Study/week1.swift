//
//  week1.swift
//  Study
//
//  Created by H on 1/14/24.
//

import Foundation

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// MARK: - 옵셔널 바인딩 관련

/// 1, 강제 추출
func forcedUnwrapping(value: String?, index: Int) {
    print("\(index)번 상품은 \(value!)입니다.")
}

/// 2. nil인지 아닌지 확인 후, 강제 추출
func afterCheckForcedUnwrapping(value: String?, index: Int) {
    if value != nil {
        print("\(index)번 상품은 \(value!)입니다.")
    } else {
        print("\(index)번 상품은 nil입니다.")
    }
}

/// 3. 옵셔널 바인딩
/// 3-1. if let 바인딩
func ifLetBinding(value: String?, index: Int) {
    if let safeValue = value {
        print("\(index)번 상품은 \(safeValue)입니다.")
    } else {
        print("\(index)번 상품은 nil입니다.")
    }
}
/// 3-2. guard let 바인딩
func guardLetBinding(value: String?, index: Int) {
    guard let safeValue = value else {
        print("\(index)번 상품은 nil입니다.")
        return
    }
    
    print("\(index)번 상품은 \(safeValue)입니다.")
}

/// 4. 닐 코어레싱
func nilCoalescing(value: String?, index: Int) {
    print("\(index)번 상품은 \(value ?? "nil")입니다.")
}

// MARK: - 실행 관련

/// 상품 리스트를 출력하는 함수
func printProductsList() {
    print("1. 강제 추출")
    for index in 0..<productsList.count {
        forcedUnwrapping(value: productsList[index], index: index)
    }
    print("------------------------------")
    
    print("2. nil 체크 후 강제 추출")
    for index in 0..<productsList.count {
        afterCheckForcedUnwrapping(value: productsList[index], index: index)
    }
    print("------------------------------")
    
    print("3-1. if let 바인딩")
    for index in 0..<productsList.count {
        ifLetBinding(value: productsList[index], index: index)
    }
    print("------------------------------")
    
    print("3-2. guard let 바인딩")
    for index in 0..<productsList.count {
        guardLetBinding(value: productsList[index], index: index)
    }
    print("------------------------------")
    
    print("4. 닐 코어레싱")
    for index in 0..<productsList.count {
        nilCoalescing(value: productsList[index], index: index)
    }
    print("------------------------------")
}

/// 상품 번호로 상품을 구매하는 함수
func buy(productNumber: Int) {
    print("\(productNumber)번 상품을 선택했습니다.")
    
    guard let safeProduct = productsList[productNumber] else {
        print("\(productNumber)번 상품은 존재하지 않는 상품입니다.")
        return
    }
    
    if budget <= 0 {
        print("예산이 초과되었습니다.")
        return
    }
    
    print("\(productNumber)번 상품을 구매했습니다.")
    productsList[productNumber] = nil
    budget -= 1000
}

/// 상품을 랜덤하게 구매하는 함수
func buyRandomly() {
    printProductsList()
    
    for _ in 0..<productsList.count {
        let randomNumber = Int.random(in: 0..<productsList.count)
        buy(productNumber: randomNumber)
    }
}
