//
//  QuoteService.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import Foundation

protocol QuoteServiceProtocol {

    func fetchQuotes(bookID: String?, parameters: PaginationParameters, completion: @escaping (Result<QuoteResponse, Error>) -> Void)
}

class QuoteService: QuoteServiceProtocol {

    let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchQuotes(bookID: String? = nil, parameters: PaginationParameters, completion: @escaping (Result<QuoteResponse, Error>) -> Void) {
        var route: QuoteRoute
        if let bookID = bookID {
            route = QuoteRoute.movieQuotes(identifier: bookID, parameters: parameters)
        } else {
            route = QuoteRoute.quotes(parameters: parameters)
        }
        httpClient.request(for: route, completion: completion)
    }
}
