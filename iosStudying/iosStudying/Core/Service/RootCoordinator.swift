//
//  RootCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class RootCoordinator {

    let window: UIWindow?

    lazy var tabBarCoordinator = TabBarCoordinator(window: window)
    lazy var authCoordinator = AuthCoordinator(window: window)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        if UserDefaults.standard.bool(forKey: PublicConstants.authKey) {
            showMainFlow()
        } else {
            showAuthFlow()
        }
    }

    private func showAuthFlow() {
        authCoordinator.start()
    }

    private func showMainFlow() {
        tabBarCoordinator.start()
    }

}
