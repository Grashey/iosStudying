//
//  RegistryCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class RegistryCoordinator {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let controller = RegistryViewController()
        navigationController?.pushViewController(controller, animated: true)
        controller.onMain = toMain
    }

    func toMain() {
        NotificationCenter.default.post(name: PublicConstants.authNotificationName, object: nil)
    }
}
