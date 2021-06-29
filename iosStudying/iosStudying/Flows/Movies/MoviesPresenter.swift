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
    private var movies: [MovieDoc] = []
    var infoViewModels: [MovieInfoViewModel] = []

    func getData() {
        service.fetchMovies { result in
            switch result {
            case .success(let data):
                self.movies = data.docs
                self.infoViewModels = self.movies.map { MovieInfoViewModel(name: $0.name,
                                                                           runtime: $0.runtimeInMinutes,
                                                                           budget: $0.budgetInMillions,
                                                                           awardNominations: $0.academyAwardNominations,
                                                                           awardWins: $0.academyAwardWINS,
                                                                           revenue: $0.boxOfficeRevenueInMillions,
                                                                           score: $0.rottenTomatoesScore)
                }
                self.viewController?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    func getBookID(index: Int) -> String {
        return movies[index].identifier
    }


}
