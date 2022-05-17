//
//  UsersPresenter.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

class UsersPresenter {
    var users : [UserViewModel] = []
    var onUserSelection: (Int) -> Void
    
    init(onUserSelection: @escaping (Int) -> Void) {
        self.onUserSelection = onUserSelection
        load()
    }
    
    func load(){
        users = [
            UserViewModel(id: 0, name: "a name", username: "an username", email: "an email"),
            UserViewModel(id: 1, name: "a name", username: "an username", email: "an email"),
            UserViewModel(id: 2, name: "a name", username: "an username", email: "an email"),
            UserViewModel(id: 3, name: "a name", username: "an username", email: "an email"),
            UserViewModel(id: 4, name: "a name", username: "an username", email: "an email"),
            UserViewModel(id: 5, name: "a name", username: "an username", email: "an email"),
        ]
    }
}
