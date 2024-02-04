//
//  Person.swift
//  Cafe
//
//  Created by Jaehun Lee on 2/3/24.
//

class Person {
    var name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int) {
        self.name = name
        self.money = money
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CafeShop) {
        if menu.price <= money {
            money -= menu.price
            
            if coffee?.kind == menu {
                coffee?.amount += 1
            } else {
                coffee = shop.order(menu)
            }
            
            print("내가 가진 커피: \(coffee!.kind) \(coffee!.amount)잔")
        } else {
            print("잔액이 부족합니다.")
        }
    }
}
