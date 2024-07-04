//
//  SceneDelegate.swift
//  Login Auth training
//
//  Created by Ai Hawok on 04/07/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        showSplashScreen()
        window?.makeKeyAndVisible()
    }
    
    func showSplashScreen() {
        let splashScreenViewController = SplashScreenViewController()
        window?.rootViewController = splashScreenViewController
 
    }
    
    func showMainScreen() {
        let loginViewController = SplashScreenViewController() // Replace with your initial view controller
        let navigationController = UINavigationController(rootViewController: loginViewController)
        window?.rootViewController = navigationController
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    
}

