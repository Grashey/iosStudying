//
//  RegistryCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class RegistryCoordinator {

    var window: UIWindow?
    var navigationController: UINavigationController?
    lazy var mainCoordinator = MainCoordinator(window: window)

    init(window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
    }

    func start() {
        let controller = RegistryViewController()
        navigationController?.pushViewController(controller, animated: true)
        controller.onMain = toMain
    }

    func toMain() {
        mainCoordinator.start()
    }
}
