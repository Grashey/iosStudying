//
//  NetworkService.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 01.06.2021.
//

import Foundation
import Alamofire

class NetworkService {
    
    let bookUrl = "https://the-one-api.dev/v2/book"
    
    func fetchBook(completion: @escaping (Book) -> Void) {
        let request = AF.request(bookUrl, method: .get)
        request.response { response in
            if let data = response.data {
                do {
                    let book = try JSONDecoder().decode(Book.self, from: data)
                    completion(book)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
