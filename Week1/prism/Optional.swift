var productsList: [String?] = ["볼펜", "텀블러", "다이어리", "에코백", "머그컵", "후드집업"]

// Optional Binding (if let)
if let product0 = productsList[0] {
    print("0번 상품은 \(product0)입니다.")
} else {
    print("0번 상품은 존재하지 않습니다.")
}

// Optional Binding (guard let)
func printProduct1() {
    guard let product1 = productsList[1] else {
        print("1번 상품은 존재하지 않습니다.")
        return
    }
    
    print("1번 상품은 \(product1)입니다.")
}
printProduct1()

// Optional Binding (switch)
switch productsList[2] {
case let product2?:
    print("2번 상품은 \(product2)입니다.")
    break
default:
    print("2번 상품은 존재하지 않습니다.")
    break
}

// Optional Chaining

// Using Nil-Coalescing Operator
let product4 = productsList[4] ?? ""
print("4번 상품은 \(product4)입니다.")

// Unconditional Unwrapping
let product5 = productsList[5]!
print("5번 상품은 \(product5)입니다.")

