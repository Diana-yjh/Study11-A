//
//  CustomTableViewCell.swift
//  FireSaturdayTableView
//
//  Created by Danny on 3/9/24.
//
import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var dataLabel: UILabel!
    @IBOutlet var circleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
