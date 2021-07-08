//
//  QuoteServiceMock.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 08.07.2021.
//

import Foundation
@testable import iosStudying

class QuoteServiceMock: QuoteServiceProtocol {

    var invokedFetchQuotes = false
    var invokedFetchQuotesCount = 0
    var invokedFetchQuotesParameters: (bookID: String?, parameters: PaginationParameters)?
    var invokedFetchQuotesParametersList = [(bookID: String?, parameters: PaginationParameters)]()
    var stubbedFetchQuotesCompletionResult: Result<QuoteResponse, Error>?

    func fetchQuotes(bookID: String?, parameters: PaginationParameters, completion: @escaping (Result<QuoteResponse, Error>) -> Void) {
        invokedFetchQuotes = true
        invokedFetchQuotesCount += 1
        invokedFetchQuotesParameters = (bookID, parameters)
        invokedFetchQuotesParametersList.append((bookID, parameters))
        if let result = stubbedFetchQuotesCompletionResult {
            completion(result)
        }
    }
}
