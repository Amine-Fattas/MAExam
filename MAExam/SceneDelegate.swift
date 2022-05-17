//
//  SceneDelegate.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private lazy var navigationController = UINavigationController(
        rootViewController: UsersVC(nibName: "UsersVC", bundle: nil))

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        configureWindow()
    }
    
    private func configureWindow(){
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }


}

