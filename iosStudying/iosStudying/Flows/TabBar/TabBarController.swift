//
//  TabBarController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureContent()
    }

    private func configureContent() {
        
        let booksVC: BooksViewController = {
            let vc = BooksViewController()
            vc.title = R.string.localizible.booksViewControllerTitle()
            return vc
        }()
        
        let quoteVC: QuotesViewController = {
            let vc = QuotesViewController()
            let quotePresenter = QuotesPresenter()
            vc.presenter = quotePresenter
            quotePresenter.viewController = vc
            vc.title = R.string.localizible.quotesViewControllerTitle()
            return vc
        }()

        self.viewControllers = [booksVC, quoteVC].map {
            UINavigationController(rootViewController: $0)
        }
        tabBar.tintColor = #colorLiteral(red: 0, green: 0.7117646337, blue: 0.8480874896, alpha: 1)
    }
}
