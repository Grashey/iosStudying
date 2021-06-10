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
        
        let isAuthorized = UserDefaults.standard.bool(forKey: R.string.localizible.isAuthorized())
        
        let controller: UIViewController = {
            if isAuthorized {
                return TabBarController()
            } else {
                return UINavigationController(rootViewController: LoginViewController())
            }
        }()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = controller
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

