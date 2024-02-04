//
//  CafeManager.swift
//  Cafe
//
//  Created by Jaehun Lee on 2/3/24.
//

class CafeManager: Person {
    func brew(_ menu: CoffeeMenu) -> Coffee {
        return Coffee(kind: menu)
    }
}
