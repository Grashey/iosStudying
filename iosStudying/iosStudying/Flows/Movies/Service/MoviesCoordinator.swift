//
//  MoviesCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import UIKit

class MoviesCoordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        guard let controller = MoviesFactory().create() as? MoviesViewController else { return }

        controller.onQuotes = { bookID in
            let quotesVC = QuoteFactory().create(bookID: bookID)
            self.navigationController.pushViewController(quotesVC, animated: true)
        }

        navigationController.viewControllers = [controller]
    }
}
