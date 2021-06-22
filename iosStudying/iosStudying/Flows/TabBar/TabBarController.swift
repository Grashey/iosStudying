//
//  TabBarController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

private enum Flows: Int {
    case books
    case quotes
}

class TabBarController: UITabBarController {

    var onBooks: (() -> Void)?
    var onQuotes: (() -> Void)?

    let booksNavigation = UINavigationController()
    let quotesNavigation = UINavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        booksNavigation.tabBarItem = UITabBarItem(title: R.string.localizible.booksViewControllerTitle(), image: nil, selectedImage: nil)
        quotesNavigation.tabBarItem = UITabBarItem(title: R.string.localizible.quotesViewControllerTitle(), image: nil, selectedImage: nil)
        viewControllers = [booksNavigation, quotesNavigation]
    }

    func showBooks() {
        onBooks?()
    }
}

extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch Flows(rawValue: viewControllers?.firstIndex(of: viewController) ?? .zero) {
        case .books: onBooks?()
        case .quotes: onQuotes?()
        case .none: break
        }
    }
}
