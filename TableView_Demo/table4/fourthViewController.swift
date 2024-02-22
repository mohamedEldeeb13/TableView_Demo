//
//  fourthViewController.swift
//  TableView_Demo
//
//  Created by Mohamed Abd Elhakam on 20/02/2024.
//
import HGPlaceholders
import UIKit

class fourthViewController: UIViewController {
    
    private let tableView4 = TableView()
    var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView4.register(UITableViewCell.self, forCellReuseIdentifier: "cell4")
        view.addSubview(tableView4)
        tableView4.delegate = self
        tableView4.dataSource = self
        tableView4.frame = view.bounds
        tableView4.backgroundColor = .link
        tableView4.showLoadingPlaceholder()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
            self.data.append("mohamed")
            self.data.append("mohamed")
            self.data.append("mohamed")
            self.data.append("mohamed")
            self.tableView4.showNoResultsPlaceholder()
            self.tableView4.showDefault()
            self.tableView4.reloadData()
        })
        
//        if data.isEmpty {
//            tableView4.isHidden = true
//            let imageView = UIImageView(frame: .zero)
//        }

        // Do any additional setup after loading the view.
    }
    
}


extension fourthViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell
    }
    
    
}
