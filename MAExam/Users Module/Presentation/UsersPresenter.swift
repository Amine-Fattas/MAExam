//
//  UsersPresenter.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

protocol UsersView : NSObject{
    func updateView()
}

protocol ErrorView : NSObject{
    func showError(error: Error)
}

class UsersPresenter {
    var users : [UserItem] = []
    var onUserSelection: (Int) -> Void
    var interactor: RemoteUsersInteractor
    weak var usersView: UsersView?
    weak var errorView: ErrorView?
    
    init(interactor: RemoteUsersInteractor,
         onUserSelection: @escaping (Int) -> Void) {
        self.onUserSelection = onUserSelection
        self.interactor = interactor
    }
    
    func loadUsers(){
        interactor.load(completion: { [weak self] result in
            switch result {
            case let .success(users):
                self?.users = users
                self?.usersView!.updateView()
            case let .failure(error):
                self?.errorView!.showError(error: error)
            }
        })
    }
}
