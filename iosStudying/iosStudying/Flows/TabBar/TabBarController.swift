//
//  TabBarController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

private enum Flows: Int {
    case books
    case movies
    case quotes
}

class TabBarController: UITabBarController {

    var onBooks: (() -> Void)?
    var onMovies: (() -> Void)?
    var onQuotes: (() -> Void)?

    let booksNavigation = UINavigationController()
    let moviesNavigation = UINavigationController()
    let quotesNavigation = UINavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        booksNavigation.tabBarItem = UITabBarItem(title: R.string.localizible.booksViewControllerTitle(), image: nil, selectedImage: nil)
        moviesNavigation.tabBarItem = UITabBarItem(title: R.string.localizible.moviesViewControllerTitle(), image: nil, selectedImage: nil)
        quotesNavigation.tabBarItem = UITabBarItem(title: R.string.localizible.quotesViewControllerTitle(), image: nil, selectedImage: nil)
        viewControllers = [booksNavigation, moviesNavigation, quotesNavigation]
    }

    func showBooks() {
        onBooks?()
    }
}

extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        viewControllers?.firstIndex(of: viewController).map {
            switch Flows(rawValue: $0) {
            case .books: onBooks?()
            case .movies: onMovies?()
            case .quotes: onQuotes?()
            default: break
            }
        }
    }
}
