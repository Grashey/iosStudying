//
//  ChaptersPresenter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import Foundation

class ChaptersPresenter {

    weak var viewController: ChaptersViewController?

    var chapters: ChapterResponse?
    let service = BookService()

    func getData() {
        guard let bookID = viewController?.bookID else { return }
        service.fetchChapters(bookID: bookID) { result in
            switch result {
            case .success(let chapters):
                self.chapters = chapters
                self.viewController?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
