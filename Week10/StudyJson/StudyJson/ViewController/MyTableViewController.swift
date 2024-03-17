//
//  ViewController.swift
//  StudyJson
//
//  Created by Yejin Hong on 3/16/24.
//

import UIKit

class MyTableViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var campers: [Camper] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        decodeData()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    func decodeData() {
        let url = Bundle.main.url(forResource: "myJson", withExtension: "json") ?? URL(fileURLWithPath: "")
        let data = try? Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        campers = try! decoder.decode([Camper].self, from: data!)
    }
}

extension MyTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? MyCell else {
            return UITableViewCell()
        }
        
        cell.setComponents(nickName: campers[indexPath.row].nickName,
                           generation: String(campers[indexPath.row].generation),
                           cellPhone: campers[indexPath.row].cellPhone)
        
        return cell
    }
    
    
}
