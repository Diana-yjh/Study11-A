//
//  ViewController.swift
//  JSONExample
//
//  Created by Jaehun Lee on 3/16/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let myJSONDecoder = JSONDecoder()

        if let url = Bundle.main.url(forResource: "camperInfos", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let camperInfos = try myJSONDecoder.decode([CamperInfo].self, from: data)
                
                print(camperInfos)
            } catch {
                print("Error Occured")
            }
        }
    }
}
