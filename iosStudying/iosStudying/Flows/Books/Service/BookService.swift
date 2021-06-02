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
    
    func fetchBook(completion: @escaping (BookResponse) -> Void) {
        httpClient.request(for: BooksRoute(), completion: completion)
    }
    
}
