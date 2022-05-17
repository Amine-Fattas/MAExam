//
//  LocalTasksInteractor+Helpers.swift
//  MAExam
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation

protocol TasksSaver {
    func save(tasks: [TaskItem])
}

struct TasksInteractorWithFallback: TasksInteractor {
    let primary : TasksInteractor
    let fallback: TasksInteractor & TasksSaver
    func load(completion: @escaping (Result<[TaskItem], Error>) -> Void) {
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
