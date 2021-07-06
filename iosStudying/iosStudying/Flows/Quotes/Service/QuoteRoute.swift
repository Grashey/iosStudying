//
//  QuoteRoute.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import Foundation

enum QuoteRoute {
    case quotes(parameters: PaginationParameters)
    case movieQuotes(identifier: String, parameters: PaginationParameters)
}

extension QuoteRoute: Route {

    var url: String {
        switch self {
        case .quotes:
            return "/quote"
        case let .movieQuotes(identifier, _):
            return "/movie/\(identifier)/quote"
        }
    }

    var parameters: [String: Any] {
        switch self {
        case let .quotes(parameters):
            return parameters.toDict() ?? [:]
        case let .movieQuotes(_, parameters):
            return parameters.toDict() ?? [:]
        }
    }
}
