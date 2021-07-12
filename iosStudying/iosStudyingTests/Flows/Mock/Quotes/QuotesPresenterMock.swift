//
//  QuotesPresenterMock.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 07.07.2021.
//

import Foundation
@testable import iosStudying

class QuotesPresenterMock: QuotesPresenterProtocol {

    var viewModels: [QuoteViewModel] = []

    var loadNextWasLoaded = false
    func loadNext() {
        loadNextWasLoaded = true
    }

    var operateFavoriteWasLoaded = false
    func operateFavorite(index: Int) {
        operateFavoriteWasLoaded = true
    }

    var removeAllWasLoaded = false
    func removeAll() {
        removeAllWasLoaded = true
    }
}
