struct ContactFormatChecker {
    //MARK: - 나이 형식 체크
    func checkAge(age: String) -> Bool {
        guard let ageToInt = Int(age) else {
            return false
        }
        
        if ageToInt > 999 {
            return false
        }
        
        return true
    }
    
    //MARK: - 연락처 형식 체크 ("02"를 Int로 변환 시 "2"가 됨 -> 자리 수 변경)
    func checkPhoneNum(num: String) -> Bool {
        let numArray: [String] = num.components(separatedBy: "-")
        guard Int(numArray.joined()) != nil else {
            return false
        }
        
        if numArray.count != 3 {
            return false
        }
        
        if Array(num).count < 9 {
            return false
        }
        
        return true
    }
    
}
