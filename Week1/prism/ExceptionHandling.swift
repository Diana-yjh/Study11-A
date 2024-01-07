var budget: Int = 2000
var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

func buy(productNumber: Int) {
    if !(0..<productsList.count ~= productNumber) {
        print("Failed to buy(Invalid product number)")
        return
    }
    
    if budget < 1000 {
        print("Failed to buy(Out of budget)")
        return
    }
    
    guard let _ = productsList[productNumber] else {
        print("Failed to buy(Sold out)")
        return
    }
            
    budget -= 1000
    productsList[productNumber] = nil
    print("Successfully purchased!")
}

print("Try to buy product 100")
buy(productNumber: 100)
print("Remained Money: \(budget)")
print("StockList: \(productsList)")

print("Try to buy product 0")
buy(productNumber: 0)
print("Remained Money: \(budget)")
print("StockList: \(productsList)")

print("Try to buy product 0")
buy(productNumber: 0)
print("Remained Money: \(budget)")
print("StockList: \(productsList)")

print("Try to buy product 4")
buy(productNumber: 4)
print("Remained Money: \(budget)")
print("StockList: \(productsList)")

print("Try to buy product 3")
buy(productNumber: 3)
print("Remained Money: \(budget)")
print("StockList: \(productsList)")
