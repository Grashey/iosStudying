//
//  MainCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class MainCoordinator {

    var window: UIWindow?
    let controller = TabBarController()
    var booksCoordinator: BooksCoordinator?
    var quotesCoordinator: QuotesCoordinator?
    lazy var rootCoordinator = RootCoordinator(window: window)

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {

        controller.onBooks = {
            self.booksCoordinator = BooksCoordinator()
            self.booksCoordinator?.start()
        }

        controller.onQuotes = {
            self.quotesCoordinator = QuotesCoordinator()
            self.quotesCoordinator?.start()
        }

        window?.rootViewController = controller
    }
}
