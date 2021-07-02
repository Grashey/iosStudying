//
//  BooksPresenter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import UIKit

protocol BooksPresenterProtocol {

    var viewModel: BooksViewControllerViewModel? { get set }

    func getData()
    func finishFlow()
    func getBookIDForChapters(index: Int) -> String
}

class BooksPresenter: BooksPresenterProtocol {

    weak var viewController: BooksViewController?
    private var books: [Doc] = []
    var booksViewModels: [BooksViewModel] = []
    var imagesViewModels: [ImageViewModel] = []
    var viewModel: BooksViewControllerViewModel?
    let service = BookService()

    // MARK: Temporary data
    let picsArray = [UIImage(named: "Tweety"),
                    UIImage(named: "BugsBunny"),
                    UIImage(named: "RoadRunner")]

    func getData() {
        service.fetchBooks { result in
            switch result {
            case .success(let books):
                self.books = books.docs
                self.booksViewModels = self.books.map { BooksViewModel(name: $0.name) }
                self.imagesViewModels = self.picsArray.map { ImageViewModel(image: $0 ?? UIImage()) }
                self.viewModel = BooksViewControllerViewModel(sections: [.books(self.booksViewModels), .images(self.imagesViewModels)])
                self.viewController?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    func finishFlow() {
        UserDefaults.standard.set(false, forKey: PublicConstants.authKey)
        viewController?.onFinishFlow?()
    }

    func getBookIDForChapters(index: Int) -> String {
        return books[index].identifier
    }
}
