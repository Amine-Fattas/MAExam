//
//  LocalUsersInteractor.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public class LocalUsersInteractor : UsersInteractor {
    
    private let KEY = "users"
    private let cacheStore: CacheStore
    
    public init(cacheStore: CacheStore){
        self.cacheStore = cacheStore
    }
    
    public func load(completion: @escaping (Result<[UserItem], Error>) -> Void) {
        cacheStore.load(KEY: KEY,completion: { result in
            switch result {
            case let .success(data):
                do {
                    let users = try JSONDecoder().decode([UserItem].self, from: data)
                    completion(.success(users))
                }
                catch {
                    completion(.failure(NSError(domain: "Invalid Data", code: 0)))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        })
    }
}

extension LocalUsersInteractor : UsersSaver{
    public func save(users: [UserItem]){
        do {
            let data = try JSONEncoder().encode(users)
            cacheStore.save(data: data, KEY: KEY)
        }
        catch {
            print("Error Saving to cache")
        }
    }
}

