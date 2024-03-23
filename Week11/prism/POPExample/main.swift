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
