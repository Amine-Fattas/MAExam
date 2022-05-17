//
//  LocalTasksCache.swift
//  MAExam
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation

class LocalTasksInteractor : TasksInteractor {
    
    private let KEY: String
    private let cacheStore: CacheStore
    
    init(cacheStore: CacheStore, KEY: String){
        self.KEY = KEY
        self.cacheStore = cacheStore
    }
    
    func load(completion: @escaping (Result<[TaskItem], Error>) -> Void) {
        cacheStore.load(KEY: KEY,completion: { result in
            switch result {
            case let .success(data):
                do {
                    let tasks = try JSONDecoder().decode([TaskItem].self, from: data)
                    completion(.success(tasks))
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

extension LocalTasksInteractor : TasksSaver{
    func save(tasks: [TaskItem]){
        do {
            let data = try JSONEncoder().encode(tasks)
            cacheStore.save(data: data, KEY: KEY)
        }
        catch {
            print("Error Saving to cache")
        }
    }
}
