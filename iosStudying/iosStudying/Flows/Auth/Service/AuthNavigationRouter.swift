//
//  AuthNavigationRouter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

class AuthNavigationRouter: NavigationRouter {
        
    func toRegistry() {
        let controller = RegistryViewController()
        show(controller)
    }
    
    func toMain() {
        let controller = UITabBarController()
        controller.viewControllers = [BooksViewController(), UIViewController()].map {
            UINavigationController(rootViewController: $0)
        }
        setAsRoot(controller)
    }
}
