//
//  main.swift
//  POPExample
//
//  Created by Jaehun Lee on 3/23/24.
//

import Foundation

let myMacBook = MacBook(maximumChargeWattPerHour: 60, currentCapacity: 0)

myMacBook.chargeBattery(charger: charger5Wh)
myMacBook.chargeBattery(charger: charger18Wh)
myMacBook.chargeBattery(charger: charger30Wh)
myMacBook.chargeBattery(charger: charger96Wh)

var gucciBag = Bag()

gucciBag.put(item: charger5Wh)
gucciBag.put(item: charger18Wh)
gucciBag.put(item: charger30Wh)
gucciBag.put(item: charger96Wh)
gucciBag.put(item: myMacBook)

gucciBag.showItems()
