//
//  QuoteResponse.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import Foundation

// MARK: - QuoteRsponse
struct QuoteRsponse: Codable {
    let docs: [QuoteDoc]
    let total, limit, offset: Int
    let page: Int?
    let pages: Int?
}

// MARK: - Doc
struct QuoteDoc: Codable {
    let id, dialog: String
    let movie: String
    let character: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case dialog, movie, character
    }
}
