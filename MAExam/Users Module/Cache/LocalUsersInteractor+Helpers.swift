//
//  LocalUsersInteractor+Helpers.swift
//  MAExam
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation

protocol UsersSaver {
    func save(users: [UserItem])
}

protocol CacheStore {
    func save(data: Data, KEY: String)
    func load(KEY: String, completion: @escaping (Result<Data, Error>) -> Void)
}

struct UsersInteractorWithFallback: UsersInteractor {
    let primary : UsersInteractor
    let fallback: UsersInteractor & UsersSaver
    func load(completion: @escaping (Result<[UserItem], Error>) -> Void) {
        primary.load{ result in
            switch result {
            case .success:
                completion(result)
            case .failure:
                fallback.load(completion: completion)
            }
        }
    }
}
