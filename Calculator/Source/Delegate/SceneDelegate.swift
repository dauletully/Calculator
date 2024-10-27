//
//  SceneDelegate.swift
//  Calculator
//
//  Created by Dinmukhammed Begaly on 27.10.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        let viewController = CalculatorController()
        window?.rootViewController = viewController

        window?.makeKeyAndVisible()
    }
}


