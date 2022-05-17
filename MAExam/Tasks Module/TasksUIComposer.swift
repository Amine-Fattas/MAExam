//
//  TasksUIComposer.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class TasksUIComposer {
    static func compose(httpClient: HTTPClient, cacheStore: CacheStore, urlString : String) -> UIViewController{
        let remoteInteractor = RemoteTasksInteractor(
            httpClient: httpClient,
            urlString: urlString
        )
        let localInteractor = LocalTasksInteractor(cacheStore: cacheStore)

        let presenter = TasksPresenter(title: "Tasks",
                                       interactor: TasksInteractorWithFallback(
                                        primary: remoteInteractor,
                                        fallback: localInteractor))
        let vc = TasksVC(presenter: presenter, nibName: "TasksVC", bundle: nil)
        return vc
    }
}
