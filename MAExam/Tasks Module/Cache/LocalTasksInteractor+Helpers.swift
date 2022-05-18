//
//  LocalTasksInteractor+Helpers.swift
//  MAExam
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation

public protocol TasksSaver {
    func save(tasks: [TaskItem])
}

public struct TasksInteractorWithFallback: TasksInteractor {
    let primary : TasksInteractor
    let fallback: TasksInteractor & TasksSaver
    public func load(completion: @escaping (Result<[TaskItem], Error>) -> Void) {
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
