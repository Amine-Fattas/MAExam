//
//  RemoteUsersInteractor.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

class RemoteUsersInteractor {
    
    func load(completion: @escaping (Result<[UserItem], Error>) -> Void){
        let users = [
            UserItem(id: 0, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 1, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 2, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 3, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 4, name: "a name", username: "an username", email: "an email"),
            UserItem(id: 5, name: "a name", username: "an username", email: "an email"),
        ]
        
//        completion(.success(users))
        let error = NSError(domain: "Error loading users", code: 0)
        completion(.failure(error))
    }
}
