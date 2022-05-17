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
    let interactor : UsersInteractorWithFallback
    var users : [UserItem] = []
    weak var listView: ListView?
    weak var errorView: ErrorView?
    
    init(title: String,
         interactor: UsersInteractorWithFallback,
         onUserSelection: @escaping (Int) -> Void) {
        self.title = title
        self.interactor = interactor
        self.onUserSelection = onUserSelection
    }
    
    func loadUsers(){
        interactor.load { [weak self] result in
            switch result {
            case let .success(users):
                self?.users = users
                self?.listView!.updateView()
                self?.interactor.fallback.save(users: users)
            case let .failure(error):
                self?.errorView!.showError(error: error)
            }
        }
    }
}
