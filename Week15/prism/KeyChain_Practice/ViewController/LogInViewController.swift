//
//  ViewController.swift
//  KeyChain_Practice
//
//  Created by coda on 2022/01/10.
//

import UIKit

final class LogInViewController: UIViewController {
    @IBOutlet weak var pwTextField: UITextField!
    var diaryViewController: DiaryViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryViewController = self.storyboard?.instantiateViewController(withIdentifier: "diary") as? DiaryViewController
    }
    
    @IBAction func tapChangePassword(_ sender: UIButton) {
        let passwordChangeController = PasswordChangeController()
        
        present(passwordChangeController, animated: true)
    }
    
    @IBAction func tapLogInButton(_ sender: UIButton) {
        var storedPassword: String? = nil
        
        do {
            storedPassword = try KeychainManager.searchKeychainPassword(id: "password")
        } catch KeychainError.noPasword {
            self.present(AlertManager.alert(message: "등록된 패스워드가 없습니다"), animated: true)
        } catch {
            self.present(AlertManager.alert(message: error.localizedDescription), animated: true)
        }
        
        guard pwTextField.text == storedPassword else {
            self.present(AlertManager.alert(message: "패스워드가 일치하지 않습니다"), animated: true)
            
            return
        }
        
        guard let diaryViewController = diaryViewController else {
            return
        }
        
        diaryViewController.modalPresentationStyle = .fullScreen
        present(diaryViewController, animated: true)
    }
    
    @IBAction func addNewPassword(_ sender: UIButton) {
        do {
            let _ = try KeychainManager.searchKeychainPassword(id: "password")
            
            self.present(AlertManager.alert(message: "이미 등록된 패스워드가 있습니다"), animated: true)
        } catch KeychainError.noPasword {
            KeychainManager.addKeychainPassword(id: "password", password: pwTextField.text!)
            
            self.present(AlertManager.alert(message: "패스워드를 등록했습니다!"), animated: true)
        } catch {
            self.present(AlertManager.alert(message: error.localizedDescription), animated: true)
        }
    }
}

