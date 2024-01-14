class Shop {
    let name: String
    private var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

    init(name: String) {
        self.name = name
    }

    func showStock() {
        print("\(name) Shop 재고 현황")
        for (number, product) in productsList.enumerated() {
            if let _ = product {
                print("\(number)번 상품: 재고 있음")
            } else {
                print("\(number)번 상품: 품절")
            }
        }
    }
    
    func sell(number: Int, to: Camper) {
        if to.loadBudget() < 1000 {
            print("Failed to buy(Out of budget)")
            return
        }
        
        if !isValidProductNumber(number: number) {
            print("Failed to buy(Invalid product number)")
            return
        }

        if isSoldOut(number: number) {
            print("Failed to buy(Sold out)")
            return
        }

        to.subtractBudget(amount: 1000)
        makeProductSoldOut(number: number)
        print("Product\(number) successfully purchased from \(name) Shop!")
        to.showRemainedBudget()
    }
    
    private func isValidProductNumber(number: Int) -> Bool {
        return 0..<productsList.count ~= number ? true : false
    }

    private func isSoldOut(number: Int) -> Bool {
        return productsList[number] == nil ? true : false
    }

    private func makeProductSoldOut(number: Int) {
        productsList[number] = nil
    }
}

class Camper {
    private var budget: Int = 2000

    func buy(productNumber: Int, from: Shop) {
        from.sell(number: productNumber, to: self)
    }
    
    func showRemainedBudget() {
        print("Your remained budget: \(budget)")
    }
    
    func loadBudget() -> Int {
        return budget
    }
    
    func subtractBudget(amount: Int) {
        budget -= 1000
    }
}

let shop1 = Shop(name: "Alice")
let shop2 = Shop(name: "Bob")

let camper = Camper()

camper.buy(productNumber: 3, from: shop1)
camper.buy(productNumber: 5, from: shop2)
print()
shop1.showStock()
print()
shop2.showStock()

