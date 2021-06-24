//
//  MoviesPresenter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 24.06.2021.
//

import Foundation

class MoviesPresenter {

    weak var viewController: MoviesViewController?

    let service = MovieService()
    var movies: [MovieDoc] = []

    func getData() {
        service.fetchMovies { result in
            switch result {
            case .success(let data):
                self.movies = data.docs
                self.viewController?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
