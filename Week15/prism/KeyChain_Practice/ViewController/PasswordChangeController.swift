//
//  PasswordChangeController.swift
//  KeyChain_Practice
//
//  Created by Jaehun Lee on 4/20/24.
//

import UIKit

final class PasswordChangeController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호 변경"
        label.font = .preferredFont(forTextStyle: .title1)
        return label
    }()
    
    private let currentPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "기존 PW"
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private let newPasswordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "새로운 PW"
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private let currentPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let newPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var changePasswordButton: UIButton = {
        let changePasswordAction = UIAction(title: "changePassword") { _ in self.changePassword() }
        let button = UIButton(configuration: .filled(), primaryAction: changePasswordAction)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("비밀번호 변경하기", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        setupUI()
    }
    
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(currentPasswordLabel)
        self.view.addSubview(newPasswordLabel)
        self.view.addSubview(currentPasswordTextField)
        self.view.addSubview(newPasswordTextField)
        self.view.addSubview(changePasswordButton)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            
            currentPasswordTextField.centerYAnchor.constraint(equalTo: currentPasswordLabel.centerYAnchor),
            newPasswordTextField.centerYAnchor.constraint(equalTo: newPasswordLabel.centerYAnchor),
            
            currentPasswordLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 120),
            newPasswordLabel.topAnchor.constraint(equalTo: currentPasswordLabel.bottomAnchor, constant: 32),
            
            currentPasswordTextField.widthAnchor.constraint(equalToConstant: 150),
            newPasswordTextField.widthAnchor.constraint(equalToConstant: 150),
            
            currentPasswordLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 60),
            currentPasswordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 180),
            
            newPasswordLabel.leadingAnchor.constraint(equalTo: currentPasswordLabel.leadingAnchor),
            newPasswordTextField.leadingAnchor.constraint(equalTo: currentPasswordTextField.leadingAnchor),
            
            
            changePasswordButton.widthAnchor.constraint(equalToConstant: 250),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 50),
            changePasswordButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            changePasswordButton.topAnchor.constraint(equalTo: newPasswordLabel.bottomAnchor, constant: 50),
        ])
    }
    
    private func changePassword() {
        do {
            let password = try KeychainManager.searchKeychainPassword(id: "password")
            
            guard currentPasswordTextField.text == password else {
                self.present(AlertManager.alert(message: "현재 패스워드가 일치하지 않습니다"), animated: true)
                return
            }
            
            KeychainManager.updateKeychainPassword(id: "password", password: newPasswordTextField.text!)
            
            self.present(AlertManager.alert(message: "패스워드를 변경했습니다!"), animated: true)
        } catch KeychainError.noPasword {
            self.present(AlertManager.alert(message: "등록된 패스워드가 없습니다.\n등록 후 다시 시도해주세요"), animated: true)
        } catch {
            self.present(AlertManager.alert(message: error.localizedDescription), animated: true)
        }
    }
}
