//
//  ViewController.swift
//  FireSaturdayTableView
//
//  Created by Danny on 3/9/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    
    var americanFood: [String] = ["햄버거", "피자", "아메리카노"]
    var chineseFood: [String] = ["탕수육"]
    var koreanFood: [String] = ["비빔밥", "돼지갈비"]
    var japaneseFood: [String] = ["스시", "스윙스(돈까스)"]
    
    var circleImageView = UIImage(systemName: "circle")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "American"
        case 1:
            return "Chinese"
        case 2:
            return "Korean"
        case 3:
            return "Japanese"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return americanFood.count
        case 1:
            return chineseFood.count
        case 2:
            return koreanFood.count
        case 3:
            return japaneseFood.count
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        cell.imageView?.image = circleImageView
        
        if indexPath.section == 0 {
            cell.dataLabel?.text = americanFood[Int(indexPath.row)]
        } else if indexPath.section == 1 {
            cell.dataLabel?.text = chineseFood[Int(indexPath.row)]
        } else if indexPath.section == 2 {
            cell.dataLabel?.text = koreanFood[Int(indexPath.row)]
        } else if indexPath.section == 3 {
            cell.dataLabel?.text = japaneseFood[Int(indexPath.row)]
        }

        return cell
    }
    
}


