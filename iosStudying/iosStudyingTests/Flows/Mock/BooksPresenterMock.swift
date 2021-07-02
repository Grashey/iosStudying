//
//  BooksPresenterMock.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 02.07.2021.
//

import Foundation
@testable import iosStudying

class BooksPresenterMock: BooksPresenterProtocol {

    var viewModel: BooksViewControllerViewModel?

    var getDataWasCalled = false
    func getData() {
        getDataWasCalled = true
    }

    var finishFlowWasCalled = false
    func finishFlow() {
        finishFlowWasCalled = true
    }

    var getBookIDForChaptersWasCalled = false
    func getBookIDForChapters(index: Int) -> String {
        getBookIDForChaptersWasCalled = true
        return String()
    }

}
