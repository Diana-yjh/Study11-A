//
//  ViewController.swift
//  TableViewExample
//
//  Created by Jaehun Lee on 3/9/24.
//

import UIKit

enum FoodType: String {
    case American
    case Chinese
    case Korean
    case Japanese
    
    var name: String {
        return self.rawValue
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
    
    var menuTuple: [(FoodType, [Food])] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.menuTuple = menu.map { ($0.key, $0.value) }.sorted { $0.0.rawValue < $1.0.rawValue }

        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.allowsMultipleSelection = true
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuTuple.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuTuple[section].0.name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTuple[section].1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        
        cell.cellLabel.text = menuTuple[indexPath.section].1[indexPath.item].name
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
