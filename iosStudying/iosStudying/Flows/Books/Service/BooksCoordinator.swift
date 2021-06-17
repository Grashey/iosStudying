//
//  BooksCoordinator.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class BooksCoordinator {

    func start() {
        let controller = BooksViewController()

        controller.onChapters = { bookID, bookTitle in
            let chaptersVC = ChaptersViewController(bookID: bookID)
            chaptersVC.title = bookTitle
            controller.navigationController?.pushViewController(chaptersVC, animated: true)
        }
    }
}
