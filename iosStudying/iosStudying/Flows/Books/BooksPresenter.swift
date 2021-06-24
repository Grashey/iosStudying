//
//  BooksPresenter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import Foundation

class BooksPresenter {

    weak var viewController: BooksViewController?
    var books: BookResponse?
    let service = BookService()

    func getData() {
        service.fetchBooks { result in
            switch result {
            case .success(let books):
                self.books = books
                self.viewController?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    @objc func finishFlow() {
        UserDefaults.standard.set(false, forKey: PublicConstants.authKey)
        viewController?.onFinishFlow?()
    }
}
