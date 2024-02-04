//
//  CoffeeMenu.swift
//  Cafe
//
//  Created by Jaehun Lee on 2/3/24.
//

enum CoffeeMenu {
    case americano
    case latte
    
    var price: Int {
        switch self {
        case .americano:
            return 4000
        case .latte:
            return 5000
        }
    }
}
