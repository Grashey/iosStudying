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
            service?.fetchQuotes(bookID: viewController?.bookID, parameters: PaginationParameters(limit: Constants.resultsLimit, offset: offset)) { [weak self] response in
                guard let self = self else { return }
                switch response {
                case .success(let data):
                    self.offset += Constants.resultsLimit
                    self.quotes.append(contentsOf: data.docs)
                    if self.quotes.isEmpty {
                        self.showEmptyQuotesLabel()
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

    func showEmptyQuotesLabel() {
        let label = UILabel()
        label.backgroundColor = .white
        label.textAlignment = .center
        label.text = R.string.localizible.quotesEmptyQuotesLabel()
        viewController?.view.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.center.equalToSuperview()
        }
    }

    func operateFavorite(identifier: String) {
        if dataLoader.load(key: identifier) != nil {
            dataLoader.remove(key: identifier)
        } else {
            dataLoader.save(value: identifier, key: identifier)
        }
    }

    func makeQuotesViewCellModelForIndex(index: Int) -> QuoteCellViewModel {
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
