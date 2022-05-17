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
    let remoteInteractor: UsersInteractor
    let localInteractor : UsersInteractor & UsersSaver
    var users : [UserItem] = []
    weak var listView: ListView?
    weak var errorView: ErrorView?
    
    init(title: String,
         remoteInteractor: UsersInteractor,
         localInteractor : UsersInteractor & UsersSaver,
         onUserSelection: @escaping (Int) -> Void) {
        self.title = title
        self.remoteInteractor = remoteInteractor
        self.localInteractor = localInteractor
        self.onUserSelection = onUserSelection
    }
    
    func loadUsers(){
        remoteInteractor.load(completion: { [weak self] result in
            switch result {
            case let .success(users):
                self?.users = users
                self?.listView!.updateView()
                self?.localInteractor.save(users: users)
            case let .failure(error):
                self?.localInteractor.load(completion: { result in
                    switch result {
                    case let .success(users):
                        self?.users = users
                        self?.listView!.updateView()
                    case .failure(_):
                        self?.errorView!.showError(error: error)
                    }
                })
            }
        })
    }
}
