//
//  UsersUIComposer.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class UsersUIComposer {
    static func compose(httpClient: HTTPClient,
                        urlString : String,
                        onUserSelection: @escaping (Int) -> Void) -> UIViewController{
        let interactor = RemoteUsersInteractor(
            httpClient: httpClient,
            urlString: urlString
        )
        let onUserSelection = { userId in
            onUserSelection(userId)
        }
        let presenter = UsersPresenter(
            interactor: interactor,
            onUserSelection: onUserSelection)
        let vc = UsersVC(presenter: presenter, nibName: "UsersVC", bundle: nil)
        return vc
    }
}
