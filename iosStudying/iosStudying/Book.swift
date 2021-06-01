//
//  BookResponce.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 01.06.2021.
//

import Foundation

// MARK: - Book
struct Book: Codable {
    let docs: [Doc]
    let total, limit, offset, page: Int
    let pages: Int
}

// MARK: - Doc
struct Doc: Codable {
    let id, name: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }
}
