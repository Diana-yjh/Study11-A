//
//  main.swift
//  HigherOrderFunc_Study
//
//  Created by Yejin Hong on 2024/02/24.
//

//MARK - 실험 1

//struct Character {
//    var attack: () -> Void
//    var run: () -> Void
//    var defence: () -> Void
//
//    func tabShiftKey(skill: () -> Void) {
//        skill()
//    }
//}
//
//let diana = Character {
//    print("공격해!")
//} run: {
//    print("달려!")
//} defence: {
//    print("방어해!")
//}
//
//diana.tabShiftKey(skill: diana.attack)
//diana.tabShiftKey(skill: diana.run)
//diana.tabShiftKey(skill: diana.defence)

//MARK - 실험 2

//let array = [20, 50, 30, 10, 90] //200
//let filteredArray = array.filter({
//    $0 < 50
//})
//
//let reducedArray = array.reduce(5) { $0 + $1 }
//
//let mappedArray = array.map() {
//    $0 * 10
//}
//
//print(reducedArray)

//MARK - 실험 3

extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        
        self.forEach { result.append(transform($0)) }
        
        return result
    }
    
    func myFilter(_ isIncluded: (Element) -> Bool) -> Self {
        var result: [Element] = []
        
        self.forEach {
            if isIncluded($0) {
                result.append($0)
            }
        }
        
        return result
    }
    
    func myReduce<T>(_ initialResult: T, _ nextPartialResult: (T, Element) -> T) -> T {
        var result: T = initialResult
        
        self.forEach {
            result = nextPartialResult(result, $0)
        }
        
        return result
    }
}

let array = [20, 50, 30, 10, 90] //200
let filteredArray = array.myFilter{
    $0 < 50
}

let reducedArray = array.myReduce(5) { $0 + $1 }
let mappedArray = array.myMap {
    $0 * 10
}

print(mappedArray)
