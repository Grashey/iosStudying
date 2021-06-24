//
//  MovieService.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import Foundation

class MovieService {

    let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol = HTTPClient()) {
        self.httpClient = httpClient
    }

    func fetchMovies(completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        httpClient.request(for: MovieRoute.movies, completion: completion)
    }
}
