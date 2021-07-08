//
//  QuotesViewControllerMock.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 08.07.2021.
//

import Foundation
@testable import iosStudying

class QuotesViewControllerMock: QuotesViewControllerProtocol {

    var invokedBookIDSetter = false
    var invokedBookIDSetterCount = 0
    var invokedBookID: String?
    var invokedBookIDList = [String?]()
    var invokedBookIDGetter = false
    var invokedBookIDGetterCount = 0
    var stubbedBookID: String!

    var bookID: String? {
        get {
            invokedBookIDGetter = true
            invokedBookIDGetterCount += 1
            return stubbedBookID
        }
        set {
            invokedBookIDSetter = true
            invokedBookIDSetterCount += 1
            invokedBookID = newValue
            invokedBookIDList.append(newValue)
        }
    }

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }

    var invokedRefreshQuotes = false
    var invokedRefreshQuotesCount = 0
    var invokedRefreshQuotesParameters: (sender: Any, Void)?
    var invokedRefreshQuotesParametersList = [(sender: Any, Void)]()

    func refreshQuotes(_ sender: Any) {
        invokedRefreshQuotes = true
        invokedRefreshQuotesCount += 1
        invokedRefreshQuotesParameters = (sender, ())
        invokedRefreshQuotesParametersList.append((sender, ()))
    }

    var invokedShowEmptyQuotesLabel = false
    var invokedShowEmptyQuotesLabelCount = 0

    func showEmptyQuotesLabel() {
        invokedShowEmptyQuotesLabel = true
        invokedShowEmptyQuotesLabelCount += 1
    }
}
