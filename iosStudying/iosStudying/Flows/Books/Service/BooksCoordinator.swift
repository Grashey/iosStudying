//
//  BooksCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class BooksCoordinator {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func start() {
        let controller = BooksViewController()

        controller.onChapters = { bookID, bookTitle in
            let chaptersVC = ChaptersViewController(bookID: bookID)
            chaptersVC.title = bookTitle
            controller.navigationController?.pushViewController(chaptersVC, animated: true)
        }

        controller.onFinishFlow = {
            NotificationCenter.default.post(name: PublicConstants.authNotificationName, object: nil)
        }

        navigationController?.viewControllers = [controller]
    }
}