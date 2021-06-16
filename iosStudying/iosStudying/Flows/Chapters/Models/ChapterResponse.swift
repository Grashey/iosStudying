//
//  ChapterResponse.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 02.06.2021.
//

import Foundation

// MARK: - ChapterResponse
struct ChapterResponse: Codable {
    let docs: [Chapter]
    let total, limit, offset, page: Int
    let pages: Int
}

// MARK: - Chapter
struct Chapter: Codable {
    let identifier, chapterName: String

    enum CodingKeys: String, CodingKey {
        case identifier = "_id"
        case chapterName
    }
}
