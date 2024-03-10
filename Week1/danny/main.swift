//
//  main.swift
//  OptionalTraining
//
//  Created by 김민제 on 1/6/24.
//

import Foundation

//실험 1: 옵셔널 값을 사용해 봅시다.

// var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업", nil]
// var productsListStr: [String] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

/* 옵셔널 값이 추출된다.
 for i in 0...productsList.count - 1 {
 print("\(i)번 상품은 \(productsList[i])입니다.")
 }
 */

//for i in 0...productsList.count - 1 {
    // 옵셔널 바인딩을 사용해봅시다!
    // if let을 사용해봅시다!
    

//    if let product = productsList[i] {
//        // 새로운 변수에 Optional 값을 넣어서... 만약 nil이 아니라면 해당 조건이 참이므로, 아래의 print문을 출력하게 된다.
//        print("\(i)번 상품은 \(product)입니다.")
//    } else {
//        // 새로운 변수에 nil 값이 들어가게 된다면, 아래의 print문이 출력하게 된다.
//        print("값이 없습니다.")
//    }
//
    
    // 만약 let 변수에 들어가는 값이 옵셔널 타입이 아니라면 "Initializer for conditional binding must have Optional type, not String" 이라는 에러 메시지가 나온다.
    
//    if let productStr = productsListStr[i] {
//        print("\(i)번 상품은 \(productStr)입니다.")
//    } else {
//        // 새로운 변수에 nil 값이 들어가게 된다면, 아래의 print문이 출력하게 된다.
//        print("값이 없습니다.")
//    }
    
    
    // guard let을 사용해봅시다.!
    // You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed.
//    // guard 문을 사용하려면 해당 조건이 참이 되어야 하는 요구사항이 있다..? 함수안에서만 사용할 수 있다?
//    testFunc(number: i)
//
//
    // Switch를 사용해봅시다.!
    //var stream: DataStream? = nil
    ///     switch stream {
    ///     case nil:
    ///         print("No data stream is configured.")
    ///     case let x?:
    ///         print("The data stream has \(x.availableBytes) bytes available.")
    ///     }
    ///     // Prints "No data stream is configured.
    
    
//    switch productsList {
//    case nil:
//        print("값이 없습니다.")
//    case let product? = productsList[i] :
//        print("\(i)번 상품은 \(product)입니다.")
//    }
    
    
//}

// guard let을 사용해봅시다.!
// You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed.
// guard 문을 사용하려면 해당 조건이 참이 되어야 하는 요구사항이 있다..? 함수안에서만 사용할 수 있다?
//func testFunc(number: Int) {
//    guard let product = productsList[number] else {
//        return print("값이 없습니다.")
//    }


// 실험 2: 옵셔널을 활용한 경우 예외사항을 처리해봅시다.

var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

var budgetCheck: Bool = true

func buy(productNumber: Int) {
    if productNumber > 5 || productNumber < 0 {
        return
    }
    
    if let product = productsList[productNumber] {
        print("\(product) 물건을 구매하셨습니다.")
        productsList[productNumber] = nil
        budget -= 1000
    } else {
        print("해당 물품이 모두 소진되었습니다.")
    }
}

while budgetCheck {
    print("안녕하세요. 오늘의 물품입니다. 자, 골라보시죠?")
    print(productsList)
    print("물품 번호를 골라주세요.(0번 부터 시작입니다.) : ", terminator: "")
    
    if let userChoice = readLine() {
        if budget > 0 {
            if let userChoiceNumber = Int(userChoice) {
                buy(productNumber: userChoiceNumber)
            } else {
                print("잘못 입력하셨습니다.")
            }
        } else {
            budgetCheck = false
            print("예산을 초과 하셨네요.. 내일 다시 오세요.")
        }
    } else {
        budgetCheck = false
        print("강제종료하셨습니다.")
    }
    
}
