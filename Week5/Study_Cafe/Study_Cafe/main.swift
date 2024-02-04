//
//  main.swift
//  Study_Cafe
//
//  Created by Yejin Hong on 2024/02/03.
//

import Foundation

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        return 10
    }
}

class Person {
    var name: String
    var money: Int
    var coffee: Coffee?
    
    init(name: String, money: Int, coffee: Coffee? = nil) {
        self.name = name
        self.money = money
        self.coffee = coffee
    }
    
    func buy(_ menu: CoffeeMenu, at shop: CoffeeShop) {
        if menu.price <= self.money {
            shop.order(menu)
        } else {
            print("잔액이 부족합니다")
        }
    }
}

class CoffeeShop {
    let manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) {
        manager.brew(menu)
    }
}

class CafeManager {
    func brew(_ menu: CoffeeMenu) {
        print("\(menu) 나왔습니다! 맛있게 드세요~")
    }
}

class Coffee {
    let kind: CoffeeMenu
    let amount: Int = 100
    
    init(kind: CoffeeMenu) {
        self.kind = kind
    }
}

let yagom = CafeManager()
let hollys = CoffeeShop(manager: yagom)
let customer = Person(name: "Diana", money: 20)
customer.buy(.americano, at: hollys)
print("손에 있는 커피는 \(customer.coffee) 입니다.")
