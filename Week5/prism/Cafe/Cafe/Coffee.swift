//
//  Coffee.swift
//  Cafe
//
//  Created by Jaehun Lee on 2/3/24.
//

class Coffee {
    var kind: CoffeeMenu
    var amount: Int = 1
    
    init(kind: CoffeeMenu) {
        self.kind = kind
    }
}
