import Foundation

struct ContactManager {
    var contactsArray: [ContactInfo] = []
    
    mutating func addContact() {
        print("연락처 정보를 입력해 주세요: ")
        
        guard let input = readLine(), !input.isEmpty else {
            print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
            return
        }
        
        let inputStr: [String] = input.components(separatedBy: "/")
        
        guard inputStr.count == 3 else {
            return
        }
        
        let name: String = inputStr[0].replacingOccurrences(of: " ", with: "")
        let age: String = inputStr[1].replacingOccurrences(of: " ", with: "")
        let phoneNumber: String = inputStr[2].replacingOccurrences(of: " ", with: "")
        
        let contactFormatChecker = ContactFormatChecker()
        
        if !contactFormatChecker.checkAge(age: age) {
            print("입력한 나이 정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            return
        } else if !contactFormatChecker.checkPhoneNum(num: phoneNumber) {
            print("입력한 연락처 정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            return
        }
        
        contactsArray.append(ContactInfo(name: name, age: age, phone: phoneNumber))
        
        print("입력한 정보는 \(age)세 \(name)(\(phoneNumber))입니다.")
    }
    
    func showContactList(){
        let sortedArray = contactsArray.sorted{ $0 < $1 } //원본배열 안건듦
        for contact in sortedArray {
            print("- \(contact.name) / \(contact.age) / \(contact.phone)")
        }
    }
    
    func searchContact(){
        print("연락처에서 찾을 이름을 입력해주세요: ")
    
        guard let input = readLine() else {
            return
        }
        
        let matchedArr = contactsArray.filter{ $0.name == input }
        
        if matchedArr.isEmpty {
            print("연락처에 \(input) 이(가) 없습니다.")
        } else {
            for contact in matchedArr {
                print("- \(contact.name) / \(contact.age) / \(contact.phone)")
            }
        }
    }
}
