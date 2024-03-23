//
//  Chargable.swift
//  POPExample
//
//  Created by Jaehun Lee on 3/23/24.
//

typealias WattPerHour = Int
typealias Watt = Int

protocol Chargable {
    var maximumWattPerHour: WattPerHour { get }
    func convert(chargableWattPerHour: WattPerHour) -> WattPerHour
}
