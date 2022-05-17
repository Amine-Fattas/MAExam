//
//  TasksPresenter.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

class TasksPresenter {
    var tasks : [TaskItem] = []
    var interactor: TasksInteractor
    weak var listView: ListView?
    weak var errorView: ErrorView?
    
    init(interactor: TasksInteractor) {
        self.interactor = interactor
    }
    
    func loadTasks(){
        interactor.load(completion: { [weak self] result in
            switch result {
            case let .success(tasks):
                self?.tasks = tasks
                self?.listView!.updateView()
            case let .failure(error):
                self?.errorView!.showError(error: error)
            }
        })
    }
}
