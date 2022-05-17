//
//  LocalUsersInteractor.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

protocol UsersSaver {
    func save(users: [UserItem])
}

protocol CacheStore {
    func save(data: Data, KEY: String)
    func load(KEY: String, completion: @escaping (Result<Data, Error>) -> Void)
}

class LocalUsersInteractor : UsersInteractor {
    
    private let KEY = "users"
    private let usersCache: CacheStore
    
    init(usersCache: CacheStore){
        self.usersCache = usersCache
    }
    
    func load(completion: @escaping (Result<[UserItem], Error>) -> Void) {
        usersCache.load(KEY: KEY,completion: { result in
            switch result {
            case let .success(data):
                do {
                    let users = try JSONDecoder().decode([UserItem].self, from: data)
                    completion(.success(users))
                }
                catch {
                    completion(.failure(NSError(domain: "Invalid Data", code: 0)))
                }
            case .failure(_):
                completion(.failure(NSError(domain: "Empty Cache", code: 404)))
            }
        })
    }
}

extension LocalUsersInteractor : UsersSaver{
    func save(users: [UserItem]){
        do {
            let data = try JSONEncoder().encode(users)
            usersCache.save(data: data, KEY: KEY)
        }
        catch {
            print("Error Saving to cache")
        }
    }
}

