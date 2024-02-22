//
//  thiredViewController.swift
//  TableView_Demo
//
//  Created by Mohamed Abd Elhakam on 19/02/2024.
//

import UIKit

class thiredViewController: UIViewController {

    @IBOutlet weak var tableview3: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview3.register(thiredTableViewCell.nib(), forCellReuseIdentifier: thiredTableViewCell.id)
        tableview3.register(fieldTableViewCell.nib(), forCellReuseIdentifier: fieldTableViewCell.id)
        tableview3.delegate = self
        tableview3.dataSource = self
    }
    
}

extension thiredViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row > 5 {
            let customCell = tableView.dequeueReusableCell(withIdentifier: thiredTableViewCell.id, for: indexPath) as! thiredTableViewCell
            customCell.configure(with: "Custom Cell", imageName: "gear")
            return customCell
        }
        
        if indexPath.row > 3 {
            let customFeild = tableView.dequeueReusableCell(withIdentifier: fieldTableViewCell.id, for: indexPath) as! fieldTableViewCell
            return customFeild
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
        cell.textLabel?.text = "Hello world"
        let mySwitch = UISwitch()
        mySwitch.addTarget(self, action: #selector(didTapChange(_ :)), for: .valueChanged)
        mySwitch.isOn = true
        cell.accessoryView = mySwitch
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @objc func didTapChange(_ sender : UISwitch) {
        if sender.isOn {
            print("is on")
        }else {
            print("is off")
        }
        
    }
    
}
