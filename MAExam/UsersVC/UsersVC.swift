//
//  UsersVC.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

struct UserViewModel {
    var users : [UserItem]
}

struct UserItem{
    let name: String
    let username: String
    let email: String
}

class UsersVC: UIViewController {
    //MARK: - Outlets -
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties -
    private let CELL_ID = "UserCell"
    
    var viewModel = UserViewModel(users: [])
    
    //MARK: - init methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initTableView()
    }
    
    private func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CELL_ID, bundle: nil), forCellReuseIdentifier: CELL_ID)
    }
    
    private func initUI(){
        title = "Users"
    }


}

//MARK: - UITableView Delegate and DataSource -
extension UsersVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID) as! UserCell
        let user = viewModel.users[indexPath.row]
        cell.ul_name.text = user.name
        cell.ul_username.text = user.username
        cell.ul_email.text = user.email
        return cell
    }
    
    
}
