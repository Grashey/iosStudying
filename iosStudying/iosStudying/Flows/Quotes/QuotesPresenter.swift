//
//  QuotesPresenter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

class QuotesPresenter {

    enum Constants {
        static let resultsLimit = 100
    }

    var service: QuoteService? = QuoteService()
    var offset = Int.zero
    var quotes: [QuoteDoc] = []
    weak var viewController: QuotesViewController?
    var isLoading = false
    let dataLoader = DataLoader<String>()

    func loadNext() {
        if !isLoading {
            isLoading = true
            service?.fetchQuotes(parameters: PaginationParameters(limit: Constants.resultsLimit, offset: offset)) { [weak self] response in
                guard let self = self else { return }
                switch response {
                case .success(let data):
                    self.offset += Constants.resultsLimit
                    self.quotes.append(contentsOf: data.docs)
                    self.viewController?.reloadData()
                case .failure(let error):
                    print(error)
                }
                self.isLoading = false
            }
        } else {
            return
        }
    }

    func operateFavorite(identifier: String) {
        if dataLoader.load(key: identifier) != nil {
            dataLoader.remove(key: identifier)
        } else {
            dataLoader.save(value: identifier, key: identifier)
        }
    }

    func makeQuotesViewCellModelForIndex(index: Int) -> QuotesCellViewModel {
        let model = quotes[index]
        let isFavorite: Bool = {
            if dataLoader.load(key: model.identifier) != nil {
                return true
            } else {
                return false
            }
        }()
        return .init(text: model.dialog, isFavorite: isFavorite, movieName: model.movie)
    }
}
