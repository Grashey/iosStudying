//
//  QuoteService.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import Foundation

class QuoteService {
    
    let httpClient: HTTPClientProtocol
    
    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }
    
    func fetchQuotes(parameters: PaginationParameters, completion: @escaping (Result<QuoteRsponse, Error>) -> Void) {
        httpClient.request(for: QuoteRoute.quotes(parameters: parameters), completion: completion)
    }
}
