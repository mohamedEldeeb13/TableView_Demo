//
//  secondViewController.swift
//  TableView_Demo
//
//  Created by Mohamed Abd Elhakam on 19/02/2024.
//

import UIKit

class secondViewController: UIViewController {

    @IBOutlet weak var tableView2: UITableView!
    
    let data = ["first","second","third","fourth","fifth"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib  = UINib(nibName: "secondTableViewCell", bundle: nil)
        tableView2.register(nib, forCellReuseIdentifier: "secondTableViewCell")
        tableView2.delegate = self
        tableView2.dataSource = self
    }
}


extension secondViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView2.dequeueReusableCell(withIdentifier: "secondTableViewCell", for: indexPath) as! secondTableViewCell
        cell.labell1.text = data[indexPath.row]
        cell.image1.backgroundColor = .red
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did tap")
    }
    
    
}
