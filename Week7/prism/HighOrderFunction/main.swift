//
//  main.swift
//  HighOrderFunction
//
//  Created by Jaehun Lee on 2/24/24.
//

struct Character {
    let fire: () -> Void = {
        print("파이어!")
    }
    
    let ice: () -> Void = {
        print("아이스!")
    }
    
    let thunder: () -> Void = {
        print("썬더!")
    }
    
    func tabShiftKey(skill: () -> Void) {
        skill()
    }
}

// Task1
let prism = Character()
prism.tabShiftKey(skill: prism.fire)
prism.tabShiftKey(skill: prism.ice)
prism.tabShiftKey(skill: prism.thunder)

// Task2
let someArray: [Int] = Array(1...10)
let doubledArray = someArray.map { $0 << 1 } // 2, 4, 6, ..., 20
print(doubledArray)
let sumOfArray = someArray.reduce(0, +) // 55
print(sumOfArray)
let oddArray = someArray.filter { $0 % 2 != 0 } // 1, 3, 5, 7, 9
print(oddArray)
let evenArray = someArray.filter { $0 % 2 == 0 } // 2, 4, 6, 8, 10
print(evenArray)

// Task3
extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        
        for element in self {
            result.append(transform(element))
        }
        
        return result
    }
    
    func myReduce(_ initialResult: Element, _ nextPartialResult: (Element, Element) -> Element) -> Element {
        var result = initialResult
        
        for element in self {
            result = nextPartialResult(result, element)
        }
        
        return result
    }
    
    func myFilter(_ isIncluded: (Element) -> Bool) -> Self {
        var result: [Element] = []
        
        for element in self {
            if !isIncluded(element) { continue }
            result.append(element)
        }
        
        return result
    }
}

let myDoubledArrayArray = someArray.myMap { $0 << 1 }
print(myDoubledArrayArray)
let mySumOfArray = someArray.myReduce(0, +)
print(mySumOfArray)
let myOddArray = someArray.myFilter { $0 % 2 != 0 }
print(myOddArray)
let myEvenArray = someArray.myFilter { $0 % 2 == 0 }
print(myEvenArray)
