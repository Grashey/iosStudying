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
    private var quotes: [QuoteDoc] = []
    var viewModels: [QuoteViewModel] = []
    weak var viewController: QuotesViewController?
    var isLoading = false
    let dataLoader = DataLoader<String>()

    func loadNext() {
        if !isLoading {
            isLoading = true
            service?.fetchQuotes(bookID: viewController?.bookID, parameters: PaginationParameters(limit: Constants.resultsLimit, offset: offset)) { [weak self] response in
                guard let self = self else { return }
                switch response {
                case .success(let data):
                    self.offset += Constants.resultsLimit
                    self.quotes.append(contentsOf: data.docs)

                    self.viewModels = self.quotes.map { quote in
                        let isFavorite: Bool = {
                            if self.dataLoader.load(key: quote.identifier) != nil {
                                return true
                            } else {
                                return false
                            }
                        }()
                        return QuoteViewModel.init(text: quote.dialog, isFavorite: isFavorite, movieName: quote.movie)
                    }

                    if self.quotes.isEmpty {
                        self.viewController?.showEmptyQuotesLabel()
                    }
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

    func operateFavorite(index: Int) {
        if dataLoader.load(key: quotes[index].identifier) != nil {
            dataLoader.remove(key: quotes[index].identifier)
        } else {
            dataLoader.save(value: quotes[index].identifier, key: quotes[index].identifier)
        }
        viewModels[index].isFavorite.toggle()
    }

    func removeAll() {
        offset = .zero
        quotes.removeAll()
        viewModels.removeAll()
    }
}
