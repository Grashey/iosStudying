//
//  QuoteFactory.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 17.06.2021.
//

import UIKit

class QuoteFactory {

    func create(bookID: String? = nil) -> UIViewController {
       let quoteViewController = QuotesViewController()
        let quotePresenter = QuotesPresenter()
        quoteViewController.presenter = quotePresenter
        quotePresenter.viewController = quoteViewController
        quoteViewController.bookID = bookID
        return quoteViewController
    }
}
