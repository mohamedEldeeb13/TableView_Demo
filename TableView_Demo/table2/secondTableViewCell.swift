//
//  secondTableViewCell.swift
//  TableView_Demo
//
//  Created by Mohamed Abd Elhakam on 19/02/2024.
//

import UIKit

class secondTableViewCell: UITableViewCell {
    
    static let id = "secondTableViewCell"

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var labell1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
