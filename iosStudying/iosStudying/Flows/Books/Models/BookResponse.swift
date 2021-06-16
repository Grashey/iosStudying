//
//  BookResponse.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 01.06.2021.
//

import Foundation

// MARK: - BookResponse
struct BookResponse: Codable {
    let docs: [Doc]
    let total, limit, offset, page: Int
    let pages: Int
}

// MARK: - Doc
struct Doc: Codable {
    let identifier, name: String

    enum CodingKeys: String, CodingKey {
        case identifier = "_id"
        case name
    }
}
