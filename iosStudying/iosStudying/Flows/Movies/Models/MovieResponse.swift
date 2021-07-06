//
//  MovieResponse.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let docs: [MovieDoc]
    let total, limit, offset, page: Int
    let pages: Int
}

// MARK: - Doc
struct MovieDoc: Codable {
    let identifier, name: String
    let runtimeInMinutes, budgetInMillions: Int
    let boxOfficeRevenueInMillions: Double
    let academyAwardNominations, academyAwardWINS: Int
    let rottenTomatoesScore: Double

    enum CodingKeys: String, CodingKey {
        case identifier = "_id"
        case name, runtimeInMinutes, budgetInMillions, boxOfficeRevenueInMillions, academyAwardNominations
        case academyAwardWINS = "academyAwardWins"
        case rottenTomatoesScore
    }
}
