//
//  BooksFactory.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import UIKit

class BooksFactory {

    func create() -> UIViewController {
        let viewController = BooksViewController()
        let presenter = BooksPresenter()
        viewController.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}
