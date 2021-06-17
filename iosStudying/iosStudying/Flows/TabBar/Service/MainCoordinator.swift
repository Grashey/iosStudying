//
//  MainCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class MainCoordinator {
    
    var window: UIWindow?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let controller = TabBarController()
        
        window?.rootViewController = controller
    }
}
