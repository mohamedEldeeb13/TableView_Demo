//
//  fieldTableViewCell.swift
//  TableView_Demo
//
//  Created by Mohamed Abd Elhakam on 19/02/2024.
//

import UIKit

class fieldTableViewCell: UITableViewCell , UITextFieldDelegate {

    static let id = "fieldTableViewCell"
    
    @IBOutlet weak var field: UITextField!
    static func nib()-> UINib {
        return UINib(nibName: "fieldTableViewCell", bundle: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        field.resignFirstResponder()
        print("\(textField.text ?? "")")
        return true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        field.placeholder = "Enter Something..."
        field.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
