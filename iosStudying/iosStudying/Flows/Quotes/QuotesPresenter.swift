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
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshQuotes(_:)), for: .valueChanged)
        return refreshControl
    }()
    
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
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .cancel))
                }
                self.isLoading = false
            }
        } else {
            return
        }
    }
    
    @objc func refreshQuotes(_ sender: Any) {
        offset = .zero
        loadNext()
        self.refreshControl.endRefreshing()
    }
}
