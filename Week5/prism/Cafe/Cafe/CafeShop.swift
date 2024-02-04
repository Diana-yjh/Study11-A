//
//  CafeShop.swift
//  Cafe
//
//  Created by Jaehun Lee on 2/3/24.
//

class CafeShop {
    var manager: CafeManager
    
    init(manager: CafeManager) {
        self.manager = manager
    }
    
    func order(_ menu: CoffeeMenu) -> Coffee {
        return manager.brew(menu)
    }
}
