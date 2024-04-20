//
//  KeychainManager.swift
//  KeyChain_Practice
//
//  Created by Jaehun Lee on 4/20/24.
//

import Foundation
import UIKit

enum KeychainError: Error {
    case noPasword
    case unexpectedPasswordData
    case unhandledError(status: OSStatus)
}

struct KeychainManager {
    static func searchKeychainPassword(id: String) throws -> String {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: id,
                                    kSecReturnAttributes as String: true,
                                    kSecReturnData as String: true]
        
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status != errSecItemNotFound else {
            throw KeychainError.noPasword
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.unhandledError(status: status)
        }
        
        guard let item = item as? [String: Any],
              let passwordData = item[kSecValueData as String] as? Data,
              let password = String(data: passwordData, encoding: .utf8) else {
            throw KeychainError.unexpectedPasswordData
        }
        
        return password
    }
    
    static func addKeychainPassword(id: String, password: String) {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: id,
                                    kSecValueData as String: password.data(using: .utf8)!]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            return
        }
    }
    
    static func updateKeychainPassword(id: String, password: String) {
        let query: [String: Any] = [kSecClass as String: kSecClassGenericPassword,
                                    kSecAttrAccount as String: id]
        
        let attributes: [String: Any] = [kSecAttrAccount as String: id,
                                         kSecValueData as String: password.data(using: .utf8)!]
        
        let status = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
        
        guard status == errSecSuccess else {
            return
        }
    }
}

struct AlertManager {
    static func alert(message: String) -> UIAlertController {
        let alertController = UIAlertController(title: "Alert",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default))
        
        return alertController
    }
}
