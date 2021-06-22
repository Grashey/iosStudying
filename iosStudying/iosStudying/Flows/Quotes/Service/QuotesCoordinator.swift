//
//  QuotesCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class QuotesCoordinator {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let controller = QuoteFactory().create()

        navigationController?.viewControllers = [controller]
    }
}
