//
//  BookServiceMock.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 05.07.2021.
//

import Foundation
@testable import iosStudying

class BookServiceMock: BookServiceProtocol {

    var invokedFetchBooks = false
    var invokedFetchBooksCount = 0
    var stubbedFetchBooksCompletionResult: Result<BookResponse, Error>?

    func fetchBooks(completion: @escaping (Result<BookResponse, Error>) -> Void) {
        invokedFetchBooks = true
        invokedFetchBooksCount += 1
        if let result = stubbedFetchBooksCompletionResult {
            completion(result)
        }
    }
}
