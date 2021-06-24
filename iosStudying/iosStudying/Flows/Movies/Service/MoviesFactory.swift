//
//  MoviesFactory.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import UIKit

class MoviesFactory {

    func create() -> UIViewController {
        let viewController = MoviesViewController()
        let presenter = MoviesPresenter()
        viewController.presenter = presenter
        presenter.viewController = viewController
        return viewController
    }
}
