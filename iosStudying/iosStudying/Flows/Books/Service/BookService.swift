//
//  BookService.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 01.06.2021.
//

import Foundation

class BookService {

    let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchBooks(completion: @escaping (Result<BookResponse, Error>) -> Void) {
        httpClient.request(for: BooksRoute.books, completion: completion)
    }

    func fetchChapters(bookID: String, completion: @escaping (Result<ChapterResponse, Error>) -> Void) {
        httpClient.request(for: BooksRoute.chapter(identifier: bookID), completion: completion)
    }
}
