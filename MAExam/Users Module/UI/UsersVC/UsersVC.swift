//
//  UsersVC.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class UsersVC: UIViewController {
    //MARK: - Outlets -
    @IBOutlet weak var tableView: UITableView!

    //MARK: - Properties -
    private let CELL_ID = "UserCell"
    var presenter: UsersPresenter!
    let refreshControl = UIRefreshControl()
    
    //MARK: - init methods -
    init(presenter: UsersPresenter, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.presenter = presenter
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.presenter.listView = self
        self.presenter.errorView = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initTableView()
        initRefreshControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadUsers()
    }
    
    private func loadUsers(){
        refreshControl.beginRefreshing()
        presenter.loadUsers()
    }
    
    private func initTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CELL_ID, bundle: nil), forCellReuseIdentifier: CELL_ID)
    }
    
    private func initUI(){
        title = presenter.title
        refreshControl.tintColor = .orange
        if tableView.contentOffset.y == 0{
            tableView.contentOffset = CGPoint(x: 0, y: -refreshControl.frame.size.height)
        }
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
        cell.setup(name: user.name, username: user.username, email: user.email)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.onUserSelection(indexPath.row)
    }
}
//MARK: - UsersView Delegate -
extension UsersVC: ListView {
    func updateView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.refreshControl.endRefreshing()
        }
    }
}
//MARK: - ErrorView Delegate -
extension UsersVC: ErrorView {
    func showError(error: Error) {
        let onDismiss = refreshControl.endRefreshing
        DispatchQueue.main.async { [weak self] in
            self?.showAlert(error: error, onDismiss: onDismiss)
        }
    }
}

//MARK: - Refresh Controller -
extension UsersVC {
    private func initRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.onRefresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func onRefresh(_ sender: Any){
        presenter.loadUsers()
    }
}
