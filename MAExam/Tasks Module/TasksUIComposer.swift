//
//  TasksUIComposer.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class TasksUIComposer {
    static let TITLE = "Tasks"
    
    static func compose(httpClient: HTTPClient, cacheStore: CacheStore,
                        urlString : String, userId: String) -> UIViewController{
        let remoteInteractor = RemoteTasksInteractor(
            httpClient: httpClient,
            urlString: urlString + userId
        )
        let localInteractor = LocalTasksInteractor(cacheStore: cacheStore, KEY: TITLE+userId)

        let presenter = TasksPresenter(title: TITLE,
                                       interactor: TasksInteractorWithFallback(
                                        primary: remoteInteractor,
                                        fallback: localInteractor))
        let vc = TasksVC(presenter: presenter, nibName: "TasksVC", bundle: nil)
        return vc
    }
}
