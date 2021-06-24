//
//  ChaptersFactory.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import UIKit

class ChaptersFactory {

    func create(with bookID: String) -> UIViewController {
        let viewController = ChaptersViewController(bookID: bookID)
        let presenter = ChaptersPresenter()
        viewController.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}
