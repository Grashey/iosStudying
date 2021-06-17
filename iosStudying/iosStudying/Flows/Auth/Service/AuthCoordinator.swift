//
//  AuthCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class AuthCoordinator {

    var window: UIWindow?
    var navigationController: UINavigationController?
    lazy var mainCoordinator = MainCoordinator(window: window)
    lazy var registryCoordinator = RegistryCoordinator(window: window, navigationController: navigationController)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let controller = LoginViewController()

        controller.onMain = toMain
        controller.onRegistry = toRegistry

        navigationController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigationController
    }

    func toMain() {
        mainCoordinator.start()
    }

    func toRegistry() {
        registryCoordinator.start()
    }
}
