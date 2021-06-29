//
//  ChaptersPresenter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import Foundation

class ChaptersPresenter {

    weak var viewController: ChaptersViewController?

    private var chapters: [Chapter] = []
    var viewModels: [ChaptersViewModel] = []
    let service = BookService()

    func getData() {
        guard let bookID = viewController?.bookID else { return }
        service.fetchChapters(bookID: bookID) { result in
            switch result {
            case .success(let chapters):
                self.chapters = chapters.docs
                self.viewModels = self.chapters.map { ChaptersViewModel(name: $0.chapterName) }
                self.viewController?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
