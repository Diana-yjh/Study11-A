//
//  MyCell.swift
//  StudyJson
//
//  Created by Yejin Hong on 3/16/24.
//

import UIKit

class MyCell: UITableViewCell {
    @IBOutlet var nickName: UILabel!
    @IBOutlet var generation: UILabel!
    @IBOutlet var cellPhone: UILabel!
    
    func setComponents(nickName: String, generation: String, cellPhone: String){
        self.nickName.text = nickName
        self.generation.text = generation
        self.cellPhone.text = cellPhone
    }
}
