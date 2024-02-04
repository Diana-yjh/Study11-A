//
//  main.swift
//  Cafe
//
//  Created by Jaehun Lee on 2/3/24.
//

import Foundation

let customer1 = Person(name: "alice", money: 4_500)
let cafeManager1 = CafeManager(name: "bob", money: 100_000)
let ediya = CafeShop(manager: cafeManager1)

customer1.buy(.americano, at: ediya)
customer1.buy(.americano, at: ediya)
customer1.buy(.americano, at: ediya)
customer1.buy(.latte, at: ediya)
