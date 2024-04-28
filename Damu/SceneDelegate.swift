//
//  SceneDelegate.swift
//  Damu
//
//  Created by Yernur Adilbek on 12/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
//        window?.rootViewController = ViewController()
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
    }
}
