//
//  thiredTableViewCell.swift
//  TableView_Demo
//
//  Created by Mohamed Abd Elhakam on 19/02/2024.
//

import UIKit

class thiredTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var image2: UIImageView!
    static let id = "thiredTableViewCell"
    static func nib()-> UINib {
        return UINib(nibName: "thiredTableViewCell", bundle: nil)
    }

    public func configure(with title : String , imageName : String){
        title2.text = title
        image2.image = UIImage(systemName: imageName)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
