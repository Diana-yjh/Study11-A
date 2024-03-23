//
//  MacBook.swift
//  POPExample
//
//  Created by Jaehun Lee on 3/23/24.
//

struct MacBook {
    let maximumChargeWattPerHour: WattPerHour
    let currentCapacity: WattPerHour
    let maximumCapacity: WattPerHour = 100
    
    func chargeBattery(charger: Chargable) {
        if currentCapacity < maximumCapacity {
            let requiredTime = Double(maximumCapacity - currentCapacity) / Double(maximumChargeWattPerHour)
            
            print("충전이 완료되었습니다. 소요된 시간: \(requiredTime)시간")
        } else {
            print("이미 최대로 충전된 상태입니다.")
        }
    }
}
