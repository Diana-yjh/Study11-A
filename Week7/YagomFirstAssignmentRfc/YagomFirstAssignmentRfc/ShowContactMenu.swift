enum Menu: String {
    case addContact = "1"
    case showContact = "2"
    case searchContact = "3"
    case end = "x"
}

struct Contact {
    var contactManager = ContactManager()
    
    mutating func showContactMenu(){
        var ticket = true
        
        repeat {
            print("\n1) 연락처 추가, 2) 연락처 목록보기, 3) 연락처 검색, X) 종료")
            print("메뉴를 선택하세요 : ")
            
            
            guard let input = readLine(), let selectedMenu = Menu(rawValue: input) else {
                print("선택이 잘못되었습니다 확인 후 다시 입력해주세요")
                continue
            }
            
            switch selectedMenu {
            case .addContact:
                contactManager.addContact()
            case .showContact:
                contactManager.showContactList()
            case .searchContact:
                contactManager.searchContact()
            case .end:
                ticket = false
                print("[프로그램 종료]")
            }
        } while (ticket)
    }
}
