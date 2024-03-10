//
//  CustomTableViewCell.swift
//  TableViewStudy
//
//  Created by Yejin Hong on 3/9/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var circleImageView: UIImageView!
    @IBOutlet var menuLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            circleImageView.image = UIImage(systemName: "circle.inset.filled")
        } else {
            circleImageView.image = UIImage(systemName: "circle")
        }
    }
}
