//
//  BooksPresenterTests.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 05.07.2021.
//

import XCTest
@testable import iosStudying

class BooksPresenterTests: XCTestCase {

    var presenter: BooksPresenter!
    var viewControllerMock: BooksViewControllerMock!
    var serviceMock: BookServiceMock!

    override func setUpWithError() throws {
        serviceMock = .init()
        presenter = BooksPresenter(service: serviceMock)
        viewControllerMock = .init()
        presenter.viewController = viewControllerMock
    }

    override func tearDownWithError() throws {
        serviceMock = nil
        viewControllerMock = nil
        presenter = nil
    }

    func test_getData_success() {
        // given
        serviceMock.stubbedFetchBooksCompletionResult = .success(TestDataSuccess.responseData)
        let booksViewModels = [BooksViewModel]()
        let imagesViewModels = presenter.picsArray.map { ImageViewModel(image: $0 ?? UIImage()) }
        let viewModel = BooksViewControllerViewModel(sections: [.books(booksViewModels), .images(imagesViewModels)])

        // when
        presenter.getData()

        // then
        XCTAssertEqual(presenter.books, TestDataSuccess.responseData.docs)
        XCTAssertEqual(presenter.booksViewModels, booksViewModels)
        XCTAssertEqual(presenter.imagesViewModels, imagesViewModels)
        XCTAssertEqual(presenter.viewModel, viewModel)
        XCTAssertTrue(viewControllerMock.invokedReload)
    }

    func test_getData_failure() {
        // given
        serviceMock.stubbedFetchBooksCompletionResult = .failure(TestDataFailure.error)

        // when
        presenter.getData()

        // then
        print(TestDataFailure.error)   // ????
    }
}

private extension BooksPresenterTests {

    enum TestDataSuccess {
        static let responseData = BookResponse(docs: [], total: 1, limit: 1, offset: 1, page: 1, pages: 1)
    }
    enum TestDataFailure: Error {
        case error
    }
}
