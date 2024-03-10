//
//  main.swift
//  HigherOrderFunction
//
//  Created by JIWOONG on 2024/02/24.
//

import Foundation

// :: MARK - 실험 1
struct Character {
    let firstSkill = { print("첫번째 스킬 사용") }
    
    let secondSkill = { print("두번째 스킬 사용") }
    
    let thirdSkill = { print("세번째 스킬 사용") }
    
    var fourthSkill: () -> Void {
        return { print("hi") }
    }
    
    func tabShiftKey(skill: () -> Void) { // firstSkill
        skill() // firstSkill()
    }
}

var gray = Character()
//gray.tabShiftKey(skill: { print("hi") }) // unnamed
//gray.tabShiftKey(skill: gray.thirdSkill)
//gray.tabShiftKey(skill: gray.fourthSkill)


// :: MARK - 실험 2
/// 클로저를 매개변수로 받거나, 클로저를 반환하는 함수를 고차함수라 한다.
/// ex) map(), reduce(), filter()

var numberArr: [Int] = [1,2,3,4,5]
//let plusFourNumberArr = numberArr.map { $0 + 4 }
let plusFourNumberArr = numberArr.map({ (number: Int) -> Int in
    return number + 4
})

print("default     : \(numberArr)")
print("")
print("map(+4)     : \(plusFourNumberArr)")

//let sumNumberArr = numberArr.reduce(0) { $0 + $1 }
let sumNumberArr = numberArr.reduce(0, +)
//let sumNumberArr = numberArr.reduce(0, { (first: Int, second: Int ) -> Int in
//    return first + second
//})
let stringArr = ["대니","디아나","건디","프리즘","렛츠고"]
let sumOfStringArr = stringArr.reduce("") { $0 + $1 + " " }

print("reduce(sum) : \(sumOfStringArr)")

print("reduce(sum) : \(sumNumberArr)")

let upperThreeArr = numberArr.filter { $0 > 3 }


print("filter(>3)  : \(upperThreeArr)")
print("")

// :: MARK - 실험 3

extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var resultArr: [T] = []
        
        for item in self {
            resultArr.append(transform(item))
        }
        return resultArr
    }
    
    func myReduce(_ initialResult: Element, _ nextPartialResult: (Element, Element) -> Element) -> Element {
        var result = initialResult
        
        for item in self {
            result = nextPartialResult(result, item)
        }
        return result
    }
    
    func myFilter(_ isIncluded: (Element) -> Bool) -> [Element] {
        var resultArr: [Element] = []
        
        for item in self {
            if isIncluded(item) {
                resultArr.append(item)
            }
        }
        return resultArr
    }
}
print("실험 3")
print("default     : \(numberArr)")

let plusFourOfNumberArrThroughMyMap = numberArr.myMap { $0 + 4 }
let toStringOfNumberArrThroughMyMap = numberArr.myMap { String($0) }
print("map(+4)     : \(plusFourOfNumberArrThroughMyMap)")
print("map(string) : \(toStringOfNumberArrThroughMyMap)")

let sumOfStringArrThroughMyReduce = stringArr.myReduce("") { $0 + $1 + " " }
print("reduce(sum) : \(sumOfStringArrThroughMyReduce)")

let upperThreeArrThroughMyFilter = numberArr.myFilter { $0 > 3 }
print("filter(>3)  : \(upperThreeArrThroughMyFilter)")
