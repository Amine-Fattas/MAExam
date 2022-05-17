//
//  TasksUIComposer.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class TasksUIComposer {
    static func compose(httpClient: HTTPClient, urlString : String) -> UIViewController{
        let interactor = RemoteTasksInteractor(
            httpClient: httpClient,
            urlString: urlString
        )

        let presenter = TasksPresenter(title: "Tasks", interactor: interactor)
        let vc = TasksVC(presenter: presenter, nibName: "TasksVC", bundle: nil)
        return vc
    }
}
