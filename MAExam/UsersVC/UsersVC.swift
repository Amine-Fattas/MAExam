//
//  UsersVC.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class UsersPresenter {
    var users : [UserItem] = []
    var onUserSelection: (Int) -> Void
    
    init(onUserSelection: @escaping (Int) -> Void) {
        self.onUserSelection = onUserSelection
        load()
    }
    
    func load(){
        users = [
            UserItem(id: 0, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 1, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 2, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 3, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 4, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 5, name: "a name", username: "an username", email: "an email"),
        ]
    }
}

struct UserItem{
    let id: Int
    let name: String
    let username: String
    let email: String
}

class UsersVC: UIViewController {
    //MARK: - Outlets -
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties -
    private let CELL_ID = "UserCell"
    
    var presenter: UsersPresenter!
    
    //MARK: - init methods -
    init(presenter: UsersPresenter, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.presenter = presenter
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
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
        self.presenter.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID) as! UserCell
        let user = presenter.users[indexPath.row]
        cell.ul_name.text = user.name
        cell.ul_username.text = user.username
        cell.ul_email.text = user.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.onUserSelection(indexPath.row)
    }
}
