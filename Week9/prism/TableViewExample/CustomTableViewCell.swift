//
//  CustomTableViewCell.swift
//  TableViewExample
//
//  Created by Jaehun Lee on 3/9/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var cellLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        cellImage.image = selected ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "circle")
    }
}
