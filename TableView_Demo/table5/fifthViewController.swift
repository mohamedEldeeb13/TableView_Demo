//
//  fifthViewController.swift
//  TableView_Demo
//
//  Created by Mohamed Abd Elhakam on 22/02/2024.
//

import UIKit

class User {
    let name : String
    var isFavorite : Bool
    var isMuted : Bool
    init(name: String, isFavorite: Bool, isMuted: Bool) {
        self.name = name
        self.isFavorite = isFavorite
        self.isMuted = isMuted
    }
}

class fifthViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    var users : [User] = [
        "Mohamed Eldeeb",
        "Ahmed Eldeeb",
        "Ali Eldeeb",
        "Youssef Eldeeb",
        "Omar Eldeeb",
        "Karim Eldeeb",
        "Mostafa Eldeeb",
    ].compactMap {
        User(name: $0, isFavorite: false, isMuted: false)
    }
    
  
    private let fifthTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell5")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(fifthTableView)
        fifthTableView.delegate = self
        fifthTableView.dataSource = self
        title = "Custom Swipe"
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        fifthTableView.frame = view.frame
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath)
        cell.textLabel?.text = "Hello world"
        if user.isFavorite {
            cell.backgroundColor = .systemBlue
        }else if user.isMuted {
            cell.backgroundColor = .systemOrange
        }else {
            cell.backgroundColor = nil
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            self.users.remove(at: indexPath.row)
            self.fifthTableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let user = users[indexPath.row]
        let favoriteActionTitle = user.isFavorite ? "UnFavorite" : "Favorite"
        let mutedActiontitle = user.isMuted ? "UnMuted" : "Muted"
        
        let favoriteAction = UITableViewRowAction(style: .normal, title: favoriteActionTitle) { _, indexPath in
            self.users[indexPath.row].isFavorite.toggle()
            self.fifthTableView.reloadRows(at: [indexPath], with: .automatic)
        }
        let mutedAction = UITableViewRowAction(style: .normal, title: mutedActiontitle) { _, indexPath in
            self.users[indexPath.row].isMuted.toggle()
            self.fifthTableView.reloadRows(at: [indexPath], with: .automatic)
        }
        favoriteAction.backgroundColor = .systemBlue
        mutedAction.backgroundColor = .systemOrange
        return [deleteAction , favoriteAction , mutedAction]
    }
    
    
    
}
