//
//  ViewController.swift
//  TableViewStudy
//
//  Created by Yejin Hong on 3/9/24.
//

import UIKit

enum FoodType: String, CaseIterable {
    case American
    case Chinese
    case Korean
    case Japanese
    
    var type: String {
        switch self {
        case .American:
            return "American"
        case .Chinese:
            return "Chinese"
        case .Korean:
            return "Korean"
        case .Japanese:
            return "Japanese"
        }
    }
}

struct Food {
    let name: String
    var price: Int
}

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let foodType = FoodType.allCases[section]
        let menu = menu[foodType] ?? []
        
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        let foodType = FoodType.allCases[indexPath.section]
        let menuName = menu[foodType]?[indexPath.row]
        
        cell.menuLabel.text = menuName?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return Menu.allCases[section].rawValue
        return FoodType.allCases[section].type
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return FoodType.allCases.count
    }
}
