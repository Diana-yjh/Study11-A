import UIKit

// Model
struct Registrant {
    let name: String
    let phoneNumber: String
}

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var registrantList: [Registrant] = [] // Model
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hitRegisterButton(_ sender: Any) {
        register()
    }
    
    @IBAction func hitCheckButton(_ sender: Any) {
        checkRegistrant()
    }
    
    func register() {
        guard let safeName = nameTextField.text else {
            print("이름 TextField가 비어 있습니다.")
            return
        }
        
        guard let safePhoneNumber = phoneNumberTextField.text else {
            print("전화번호 TextField가 비어 있습니다.")
            return
        }
        
        if validatePhoneNumber(safePhoneNumber) {
            let registrant = Registrant(name: safeName, phoneNumber: safePhoneNumber)
            registrantList.append(registrant)
            print("\(registrant)님이 등록되었습니다.")
        } else {
            print("등록되지 않았습니다.")
        }
        
        nameTextField.text = ""
        phoneNumberTextField.text = ""
    }
    
    func validatePhoneNumber(_ input: String) -> Bool {
        let regex = "^01[0-1, 7][0-9]{7,8}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = phonePredicate.evaluate(with: input)
        
        if isValid {
            print("유효한 전화번호 입니다.")
            return true
        } else {
            print("유효하지 않은 전화번호 입니다.")
            return false
        }
    }
    
    func checkRegistrant() {
        if let currentRegistrant = registrantList.last {
            nameLabel.text = "\(currentRegistrant.name)"
            phoneNumberLabel.text = "\(currentRegistrant.phoneNumber)"
        }
    }
}
