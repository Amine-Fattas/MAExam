//
//  UsersUIComposer.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class UsersUIComposer {
    static func compose(httpClient: HTTPClient,
                        cacheStore: CacheStore,
                        urlString : String,
                        onUserSelection: @escaping (Int) -> Void) -> UIViewController{
        let remoteInteractor = RemoteUsersInteractor(
            httpClient: httpClient,
            urlString: urlString
        )
        let localInteractor = LocalUsersInteractor(usersCache: cacheStore)
        let onUserSelection = { userId in
            onUserSelection(userId)
        }
        let presenter = UsersPresenter(
            title: "Users",
            interactor: UsersInteractorWithFallback(primary: remoteInteractor,
                                                    fallback: localInteractor),
            onUserSelection: onUserSelection)
        let vc = UsersVC(presenter: presenter, nibName: "UsersVC", bundle: nil)
        return vc
    }
}
