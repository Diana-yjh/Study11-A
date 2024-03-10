//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    var name: String?
    var phoneNumber: String?
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
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        NotificationCenter.default.addObserver(self, selector: #selector(register), name: Notification.Name("hitRegister"), object: nil)
        
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("hitRegister"), object: nil)
    }
    
    @objc func register() {
        let registrant: Registrant = Registrant(name: nameTextField.text, phoneNumber: phoneNumberTextField.text)
        registrantList.append(registrant)
        nameLabel.text = registrantList.last?.name
        phoneNumberLabel.text = registrantList.last?.phoneNumber
        
        
    }
    
}
