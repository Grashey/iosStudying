//
//  BooksNavigationRouter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import Foundation

class BooksNavigationRouter: NavigationRouter {
    
    func toAuth() {
        let controller = LoginViewController()
        setAsRoot(controller)
    }
    
    func toChapters(bookID: String) {
        let controller = ChaptersViewController(bookID: bookID)
        show(controller)
    }
}
