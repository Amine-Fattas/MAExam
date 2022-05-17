//
//  SceneDelegate.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient()
    }()
    
    private lazy var cacheStore: CacheStore = {
        NSCacheStore(cache: NSCache<NSString, NSData>())
    }()
    
    private let USERS_URL = "https://jsonplaceholder.typicode.com/users/"
    private let TASKS_URL = "https://jsonplaceholder.typicode.com/todos?userId="

    private lazy var navigationController = UINavigationController(
        rootViewController: UsersUIComposer.compose(
            httpClient: httpClient,
            cacheStore: cacheStore,
            urlString: USERS_URL,
            onUserSelection: { [weak self] userId in
                self?.showTask(of: userId)
        }))

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        configureWindow()
    }
    
    private func configureWindow(){
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func showTask(of userId: Int){
        let urlString = "\(TASKS_URL)\(userId)"
        let vc = TasksUIComposer.compose(httpClient: httpClient,
                                         cacheStore: cacheStore,
                                         urlString: urlString)
        navigationController.pushViewController(vc, animated: true)
        print("Selected ID: ", userId)
    }


}

