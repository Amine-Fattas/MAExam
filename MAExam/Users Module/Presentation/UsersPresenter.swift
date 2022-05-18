//
//  UsersPresenter.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public class UsersPresenter {
    public let title: String
    public let onUserSelection: (Int, String) -> Void
    public let interactor : UsersInteractorWithFallback
    public var users : [UserItem] = []
    weak var listView: ListView?
    weak var errorView: ErrorView?
    
    public init(title: String,
         interactor: UsersInteractorWithFallback,
         onUserSelection: @escaping (Int, String) -> Void) {
        self.title = title
        self.interactor = interactor
        self.onUserSelection = onUserSelection
    }
    
    public func loadUsers(){
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
