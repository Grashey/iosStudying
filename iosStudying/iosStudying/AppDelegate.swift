//
//  AppDelegate.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [LoginViewController(), UIViewController()].map {
            UINavigationController(rootViewController: $0)
        }
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

