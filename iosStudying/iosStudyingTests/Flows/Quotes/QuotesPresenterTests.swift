//
//  QuotesPresenterTests.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 08.07.2021.
//

import XCTest
@testable import iosStudying

class QuotesPresenterTests: XCTestCase {

    var presenter: QuotesPresenter!
    var viewControllerMock: QuotesViewControllerMock!
    var serviceMock: QuoteServiceMock!

    override func setUpWithError() throws {
        serviceMock = .init()
        presenter = QuotesPresenter(service: serviceMock)
        viewControllerMock = .init()
        presenter.viewController = viewControllerMock
    }

    override func tearDownWithError() throws {
        serviceMock = nil
        viewControllerMock = nil
        presenter = nil
    }

    func test_loadNext_success() {
        // given
        serviceMock.stubbedFetchQuotesCompletionResult = .success(TestDataSuccess.responseData)

        // when
        presenter.loadNext()

        // then
        XCTAssertEqual(presenter.quotes, TestDataSuccess.responseData.docs)
        XCTAssertEqual(presenter.viewModels, TestDataSuccess.viewModels)
        XCTAssertTrue(viewControllerMock.invokedReloadData)
        XCTAssertTrue(viewControllerMock.invokedShowEmptyQuotesLabel)
    }

    func test_loadData_failure() {
        // given
        serviceMock.stubbedFetchQuotesCompletionResult = .failure(TestDataFailure.error)

        // when
        presenter.loadNext()

        // then
        print(TestDataFailure.error)
    }

    func test_operateFavorite() {
        // given
        presenter.quotes = TestDataFavorites.quotes
        presenter.viewModels = TestDataFavorites.viewModels

        // when
        presenter.operateFavorite(index: 0)

        // then
        guard let viewModel = presenter.viewModels.first else { return }
        XCTAssertTrue(viewModel.isFavorite)
    }

    func test_removeAll() {
        // when
        presenter.removeAll()

        // then
        XCTAssertEqual(presenter.offset, .zero)
        XCTAssertTrue(presenter.quotes.isEmpty)
        XCTAssertTrue(presenter.viewModels.isEmpty)
    }
}

private extension QuotesPresenterTests {

    enum TestDataSuccess {
        static let responseData = QuoteResponse(docs: [], total: 1, limit: 1, offset: 1, page: 1, pages: 1)
        static let viewModels = [QuoteViewModel]()
    }

    enum TestDataFailure: Error {
        case error
    }

    enum TestDataFavorites {
        static let quotes = [QuoteDoc(identifier: "", dialog: "", movie: "", character: "")]
        static let viewModels = [QuoteViewModel(text: "", isFavorite: false, movieName: "")]
    }
}
