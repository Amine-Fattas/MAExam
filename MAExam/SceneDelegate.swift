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

    private lazy var navigationController = UINavigationController(
        rootViewController: UsersUIComposer.compose(
            httpClient: httpClient,
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
        //TODO: nagivate to TaskVC
        print("Selected ID: ", userId)
    }


}

