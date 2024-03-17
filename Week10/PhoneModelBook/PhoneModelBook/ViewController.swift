//
//  ViewController.swift
//  PhoneModelBook
//
//  Created by JIWOONG on 2024/03/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonDecoder: JSONDecoder = JSONDecoder()
        let phoneModelInfoData = loadPhoneModelInfoData()
        
        if let data = phoneModelInfoData, let decodeData = try? jsonDecoder.decode([PhoneModelInformation].self, from: data) {
            print(decodeData)
        }
    }
}

func loadPhoneModelInfoData() -> Data? {
    guard let jsonPath = Bundle.main.url(forResource: "phoneModelInfo", withExtension: "json") else { return nil }
    do {
        let data = try Data(contentsOf: jsonPath)
        return data
    } catch {
        return nil
    }
}

struct PhoneModelInformation: Decodable {
    let name: String
    let group: Int
    let phoneModel: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case group
        case phoneModel = "phone_model"
    }
}
