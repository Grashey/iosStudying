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

    let booksVC = UINavigationController(rootViewController: BooksViewController())
    let quotesVC = UINavigationController(rootViewController: QuoteFactory().create())

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        booksVC.tabBarItem = UITabBarItem(title: R.string.localizible.booksViewControllerTitle(), image: nil, selectedImage: nil)
        quotesVC.tabBarItem = UITabBarItem(title: R.string.localizible.quotesViewControllerTitle(), image: nil, selectedImage: nil)
        viewControllers = [booksVC, quotesVC]
    }
}

extension TabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        switch Flows(rawValue: (viewControllers?.firstIndex(of: viewController)) ?? .zero) {
        case .books: onBooks?()
        case .quotes: onQuotes?()
        case .none: break
        }
    }
}
