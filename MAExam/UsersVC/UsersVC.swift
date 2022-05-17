//
//  UsersVC.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class UsersVC: UIViewController {
    
    private let CELL_ID = "UserCell"
    
    @IBOutlet weak var tableView: UITableView!

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

extension UsersVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID) as! UserCell
        return cell
    }
    
    
}
