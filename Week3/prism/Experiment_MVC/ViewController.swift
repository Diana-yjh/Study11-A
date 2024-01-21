//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import UIKit

struct Registrant {
    var name: String
    var phoneNumber: String
}

class ViewController: UIViewController {
    let center = NotificationCenter.default
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        center.addObserver(self,
                           selector: #selector(self.register),
                           name: Notification.Name("Register"),
                           object: nil)
    }
    
    @IBAction func hitRegisterButton(_ sender: Any) {
        center.post(name: Notification.Name("Register"), object: nil)
    }
    
    @objc func register(notification: NSNotification) {
        let registrant = Registrant(name: nameTextField.text!, phoneNumber: phoneNumberTextField.text!)
        
        nameLabel.text = registrant.name
        phoneNumberLabel.text = registrant.phoneNumber
    }
}
