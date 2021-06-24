//
//  TabBarCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class TabBarCoordinator {

    var window: UIWindow?
    let controller = TabBarController()
    lazy var booksCoordinator = BooksCoordinator(navigationController: controller.booksNavigation)
    lazy var moviesCoordinator = MoviesCoordinator(navigationController: controller.moviesNavigation)
    lazy var quotesCoordinator = QuotesCoordinator(navigationController: controller.quotesNavigation)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        controller.onBooks = {
            self.booksCoordinator.start()
        }

        controller.onMovies = {
            self.moviesCoordinator.start()
        }

        controller.onQuotes = {
            self.quotesCoordinator.start()
        }

        window?.rootViewController = controller
        controller.showBooks()
    }
}
