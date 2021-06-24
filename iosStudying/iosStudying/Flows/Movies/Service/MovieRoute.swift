//
//  MovieRoute.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import Foundation

enum MovieRoute {
    case movies
}

extension MovieRoute: Route {

    var url: String {
        switch self {
        case .movies:
            return "/movie"
        }
    }
}
