//
//  BooksNavigationRouter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

class BooksNavigationRouter: NavigationRouter {
    
    func toAuth() {
        let controller = LoginViewController()
        setAsRoot(controller)
    }
    
    func toChapters(bookID: String, bookTitle: String) {
        let controller = ChaptersViewController(bookID: bookID)
        controller.title = bookTitle
        show(controller)
    }
    
    func presentAlert(error: Error) {
        let alert = UIAlertController(title: R.string.localizible.alertErrorTitle(), message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.localizible.alertActionOkTitle(), style: .cancel, handler: nil))
        present(alert)
    }
}
