//
//  main.swift
//  ContactsManagement
//
//  Created by Jaehun Lee on 12/29/23.
//

import Foundation

enum InputError: Error {
    case emptyInput
    case invalidInput
    case invalidAgeForm
    case invalidPhoneForm
}

struct Contact {
    var name: String
    var age: String
    var phone: String
}

enum Menu: String {
    case addContact = "1"
    case showContact = "2"
    case findContact = "3"
    case terminate = "x"
}

struct ContactManager {
    private(set) var contacts: [Contact] = []
    
    init() {
        runContactManager()
    }
    
    private mutating func runContactManager() {
        let menu = getMenuFromUser()
        
        switch menu {
        case .addContact:
            addContact()
        case .showContact:
            showContact()
        case .findContact:
            findContact()
        case .terminate:
            return
        }
        
        runContactManager()
    }
    
    private func getMenuFromUser() -> Menu {
        print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
        print("메뉴를 선택해주세요 : ", terminator: "")
        
        let menu = Menu(rawValue: readLine()!)
        
        if let menu = menu {
            return menu
        } else {
            return getMenuFromUser()
        }
    }
    
    private mutating func addContact() {
        do {
            let contact = try getContactFromUser()
            
            contacts.append(contact)
            contacts.sort { $0.name < $1.name }
        } catch InputError.emptyInput {
            print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        } catch InputError.invalidAgeForm {
            print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch InputError.invalidPhoneForm {
            print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
        } catch {
            print("잘못된 입력 형식입니다.")
        }
    }
    
    private func showContact() {
        contacts.forEach { print("- \($0.name) / \($0.age) / \($0.phone)") }
    }
    
    private func findContact() {
        print("연락처에서 찾을 이름을 입력해주세요 : ", terminator: "")
        
        let nameToFind = readLine()!
        
        let filteredContacts = contacts.filter { $0.name == nameToFind }
        
        if filteredContacts.isEmpty {
            print("연락처에 \(nameToFind) 이(가) 없습니다.")
        } else {
            filteredContacts.forEach { print("- \($0.name) / \($0.age) / \($0.phone)") }
        }
    }
    
    private func getContactFromUser() throws -> Contact {
        print("연락처 정보를 입력해주세요 : ", terminator: "")
        let trimmedInput = readLine()!.split(separator: " ").joined()

        if trimmedInput == "" {
            throw InputError.invalidInput
        }
        
        let inputRegex = #/(?<name>[^/]+)/(?<age>[^/]+)/(?<phone>[^/]+)/#
        
        guard let match = trimmedInput.wholeMatch(of: inputRegex) else {
            throw InputError.invalidInput
        }
        
        let inputName = String(match.name)
        let inputAge = String(match.age)
        let inputPhone = String(match.phone)

        let ageRegex = #/\d+/#
        let phoneRegex = #/\d{2,3}-\d{3,4}-\d{4}/#

        if inputAge.wholeMatch(of: ageRegex) == nil {
            throw InputError.invalidAgeForm
        } else if inputPhone.wholeMatch(of: phoneRegex) == nil {
            throw InputError.invalidPhoneForm
        } else {
            return Contact(name: inputName, age: inputAge, phone: inputPhone)
        }
    }
}

let contactManager = ContactManager()
