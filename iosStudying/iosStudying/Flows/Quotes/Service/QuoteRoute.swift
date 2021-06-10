//
//  QuoteRoute.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import Foundation

enum QuoteRoute {
    case quotes(parameters: PaginationParameters)
}

extension QuoteRoute: Route {

    var url: String {
        switch self {
        case .quotes:
            return "/quote"
        }
    }

    var parameters: [String: Any] {
        switch self {
        case let .quotes(parameters):
            return parameters.toDict() ?? [:]
        }
    }
}
