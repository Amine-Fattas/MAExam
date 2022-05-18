//
//  TasksPresenter.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public class TasksPresenter {
    public var tasks : [TaskItem] = []
    public let title: String
    public let interactor: TasksInteractorWithFallback
    weak var listView: ListView?
    weak var errorView: ErrorView?
    
    public init(title: String, interactor: TasksInteractorWithFallback) {
        self.title = title
        self.interactor = interactor
    }
    
    public func loadTasks(){
        interactor.load(completion: { [weak self] result in
            switch result {
            case let .success(tasks):
                self?.tasks = tasks
                self?.listView!.updateView()
                self?.interactor.fallback.save(tasks: tasks)
            case let .failure(error):
                self?.errorView!.showError(error: error)
            }
        })
    }
}
