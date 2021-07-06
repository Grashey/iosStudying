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

    func test_getData_success() {
        // given
        serviceMock.stubbedFetchBooksCompletionResult = .success(TestDataSuccess.responseData)

        // when
        presenter.getData()

        // then
        XCTAssertEqual(presenter.books, TestDataSuccess.responseData.docs)
        XCTAssertEqual(presenter.booksViewModels, TestDataSuccess.booksViewModels)
        // XCTAssertEqual(presenter.imagesViewModels, TestDataSuccess.imagesViewModels)
        // XCTAssertEqual(presenter.viewModel, TestDataSuccess.viewModel)
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

    func test_finishFlow() {
        XCTAssertTrue(viewControllerMock.invokedOnFinishFlowGetter)
    }

    func test_getBookIDForChapters(index: Int) {
        XCTAssertTrue(presenter.books[index].identifier != nil)
    }

}

private extension BooksPresenterTests {

    enum TestDataSuccess {
        static let responseData = BookResponse(docs: [], total: 1, limit: 1, offset: 1, page: 1, pages: 1)
        static let booksViewModels = [BooksViewModel]()
        static let imagesViewModels = [ImageViewModel(image: UIImage())]
        static let viewModel = BooksViewControllerViewModel(sections: [.books(booksViewModels), .images(imagesViewModels)])
    }
    enum TestDataFailure: Error {
        case error
    }
}
