//
//  Bag.swift
//  POPExample
//
//  Created by Jaehun Lee on 3/24/24.
//

protocol Portable {
    
}

struct Bag {
    private var items: [Portable] = []
    
    mutating func put(item: Portable) {
        items.append(item)
    }
    
    func showItems() {
        items.forEach { print($0) }
    }
}
