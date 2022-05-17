//
//  TasksPresenter.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

class TasksPresenter {
    var tasks : [UserItem] = []
    var onUserSelection: (Int) -> Void
    var interactor: UsersInteractor
    weak var usersView: ListView?
    weak var errorView: ErrorView?
    
    init(interactor: UsersInteractor,
         onUserSelection: @escaping (Int) -> Void) {
        self.onUserSelection = onUserSelection
        self.interactor = interactor
    }
    
    func loadUsers(){
        interactor.load(completion: { [weak self] result in
            switch result {
            case let .success(tasks):
                self?.tasks = tasks
                self?.usersView!.updateView()
            case let .failure(error):
                self?.errorView!.showError(error: error)
            }
        })
    }
}
