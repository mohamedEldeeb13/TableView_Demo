//
//  SearchViewController.swift
//  TableView_Demo
//
//  Created by Mohamed Abd Elhakam on 20/02/2024.
//

import UIKit

class SearchViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate {
    
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var searchTable: UITableView!
    
    var data = [String]()
    var filterData = [String]()
    var filtered = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        searchTable.delegate = self
        searchTable.dataSource = self
        field2.delegate = self
        // Do any additional setup after loading the view.
    }
    
    private func setUp(){
        data.append("Mohamed")
        data.append("Ahmed")
        data.append("Ali")
        data.append("Hawraa")
        data.append("Aynaa")
        data.append("Amal")
        data.append("AbdElhakam")
        data.append("Omar")
        data.append("Reem")
        data.append("Radwa")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            filterText(text+string)
        }
        return true
    }
    private func filterText(_ query : String){
        filterData.removeAll()
        for string in data {
            if string.lowercased().starts(with: query.lowercased()){
                filterData.append(string)
            }
        }
        searchTable.reloadData()
        filtered = true
    }
 
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filterData.isEmpty {
            return filterData.count
        }else{
            return filtered ? 0 : data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
        if !filterData.isEmpty {
            cell.textLabel?.text = filterData[indexPath.row]
        }else{
            cell.textLabel?.text = data[indexPath.row]
        }
        return cell
    }
}
