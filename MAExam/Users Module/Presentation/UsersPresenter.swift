//
//  UsersPresenter.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

class UsersPresenter {
    let title: String
    let onUserSelection: (Int) -> Void
    let interactor: UsersInteractor
    var users : [UserItem] = []
    weak var listView: ListView?
    weak var errorView: ErrorView?
    
    init(title: String,
        interactor: UsersInteractor,
         onUserSelection: @escaping (Int) -> Void) {
        self.title = title
        self.interactor = interactor
        self.onUserSelection = onUserSelection
    }
    
    func loadUsers(){
        interactor.load(completion: { [weak self] result in
            switch result {
            case let .success(users):
                self?.users = users
                self?.listView!.updateView()
            case let .failure(error):
                self?.errorView!.showError(error: error)
            }
        })
    }
}
