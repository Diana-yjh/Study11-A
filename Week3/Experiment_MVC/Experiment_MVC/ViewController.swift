//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    var name: String
    var phoneNumber: String
    
//    init(name: String, phoneNumber: String) {
//        self.name = name
//        self.phoneNumber = phoneNumber
//    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didReceiveRegisterInfo),
                                               name: Notification.Name("RegisterNotification"),
                                               object: nil)
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        register()
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
    }
    
    func register() {
        guard let nameText = nameTextField.text else {
            print("이름을 입력 해 주세요!")
            return
        }
        
        guard let phoneNumberText = phoneNumberTextField.text else {
            print("전화번호를 입력 해 주세요!")
            return
        }
        
        let registrant = Registrant(name: nameText, phoneNumber: phoneNumberText)
//        registrantList.append(registrant)
        NotificationCenter.default.post(name: Notification.Name("RegisterNotification"), object: nil, userInfo: nil)
    }
    
    @objc func didReceiveRegisterInfo(_ notification: Notification) {
        guard let lastRegistrantContent = registrantList.last else {
            print("등록된 값을 한번 더 확인 해 주세요!")
            return
        }
        
        nameLabel.text = lastRegistrantContent.name
        phoneNumberLabel.text = lastRegistrantContent.phoneNumber
    }
}
