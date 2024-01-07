//
//  Optional.swift
//  YagomSatStudy
//
//  Created by Yejin Hong on 2024/01/06.
//
class YagomOptional {
    var budget: Int = 2000
    var productList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]
    
    func printProductList(){
        for index in 0...productList.count - 1 {
            //1. guard let
//            guard let product = productList[index] else {
//                print("상품이 존재하지 않습니다!")
//                return
//            }
//
//            print("\(index)번 상품은 \(product) 입니다")
            
            //2. if let
//            if let product = productList[index] {
//                print("\(index)번 상품은 \(product) 입니다")
//            } else {
//                print("상품이 존재하지 않습니다!")
//            }
            
            //3.
//            let product = productList[index]!
//            print("\(index)번 상품은 \(product) 입니다")
            
            //4. ??
//            let product = productList[index] ?? "야곰"
//            print("\(index)번 상품은 \(product) 입니다")
            
            //5. switch case
            
            
            //6. 고차함수 compactMap
//            let newProductList: [String] = productList.compactMap{$0}
//            print(newProductList)
            
            //Play Ground
        }
    }
    
    func buy(productNumber: Int){
        guard productNumber < productList.count else {
            print("존재하지 않는 상품입니다!")
            return
        }
        
        guard let _ = productList[productNumber] else {
            print("품절된 상품입니다!")
            return
        }
        
        budget -= 1000
        productList[productNumber] = nil
        
        print("구매에 성공하였습니다!")
    }
    
    func execute(){
        repeat {
            print("구매하고자 하는 제품 번호를 입력해주세요: ", terminator: "")
            guard let wantedProduct = readLine(), !wantedProduct.isEmpty else {
                print("제품 번호를 다시 입력해주세요.")
                continue
            }
            
            guard let wantedProductInt = Int(wantedProduct) else {
                print("제품 번호를 다시 입력해주세요.")
                continue
            }
            
            buy(productNumber: wantedProductInt)
        } while(budget > 0)
    }
}

