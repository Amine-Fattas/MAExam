//
//  UsersUIComposer.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class UsersUIComposer {
    static let TITLE = "Users"
    
    static func compose(httpClient: HTTPClient,
                        cacheStore: CacheStore,
                        urlString : String,
                        onUserSelection: @escaping (Int, String) -> Void) -> UIViewController{
        let remoteInteractor = RemoteUsersInteractor(
            httpClient: httpClient,
            urlString: urlString
        )
        let localInteractor = LocalUsersInteractor(cacheStore: cacheStore)
        let onUserSelection = { userId, name in
            onUserSelection(userId, name)
        }
        let presenter = UsersPresenter(
            title: TITLE,
            interactor: UsersInteractorWithFallback(primary: remoteInteractor,
                                                    fallback: localInteractor),
            onUserSelection: onUserSelection)
        let vc = UsersVC(presenter: presenter, nibName: "UsersVC", bundle: nil)
        return vc
    }
}
