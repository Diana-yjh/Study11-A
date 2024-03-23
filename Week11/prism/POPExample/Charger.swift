//
//  Charger.swift
//  POPExample
//
//  Created by Jaehun Lee on 3/23/24.
//

struct Charger: Chargable {
    var maximumWattPerHour: WattPerHour
    
    func convert(chargableWattPerHour: WattPerHour) -> WattPerHour {
        return maximumWattPerHour > chargableWattPerHour ? chargableWattPerHour : maximumWattPerHour
    }
}

let charger5Wh = Charger(maximumWattPerHour: 5)
let charger18Wh = Charger(maximumWattPerHour: 18)
let charger30Wh = Charger(maximumWattPerHour: 30)
let charger96Wh = Charger(maximumWattPerHour: 96)
