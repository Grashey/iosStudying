//
//  BooksViewControllerTests.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 01.07.2021.
//

import XCTest
@testable import iosStudying

class BooksViewControllerTests: XCTestCase {

    var viewController: BooksViewController!
    var presenterMock: BooksPresenterMock!

    override func setUpWithError() throws {
        viewController = BooksViewController()
        presenterMock = .init()
        viewController.presenter = presenterMock
    }

    override func tearDownWithError() throws {
        presenterMock = nil
        viewController = nil
    }

    func test_tableView() {
        // when
        let tableView = viewController.tableView

        // then
        XCTAssertTrue(viewController === tableView.dataSource)
        XCTAssertTrue(viewController === tableView.delegate)
    }

    func test_loadView() {
        // when
        let tableView = viewController.tableView

        // then
        XCTAssertEqual(viewController.view, tableView)
    }

    func test_viewDidLoad() {
        // when
        viewController.viewDidLoad()

        // then
        XCTAssertEqual(viewController.title, R.string.localizible.booksViewControllerTitle())
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.title, R.string.localizible.logoutButtonTitle())
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.style, .plain)
        XCTAssertTrue(viewController.navigationItem.leftBarButtonItem?.target === viewController)
        XCTAssertEqual(viewController.navigationItem.leftBarButtonItem?.action, #selector(viewController.logoutButtonTapped))
        XCTAssertTrue(presenterMock.getDataWasCalled)
    }

    func test_tableViewSections() {
        // given
        let tableView = viewController.tableView
        let booksViewModels: [BooksViewModel] = []
        let imagesViewModels: [ImageViewModel] = []
        presenterMock.viewModel = BooksViewControllerViewModel(sections: [.books(booksViewModels), .images(imagesViewModels)])

        // when
        let sections = presenterMock.viewModel!.sections

        // then
        XCTAssertEqual(viewController.numberOfSections(in: tableView), sections.count)
    }

    func test_tableViewNumberOfRowsInSection() {
        // given
        let tableView = viewController.tableView
        presenterMock.viewModel = BooksViewControllerViewModel(sections: [.books(TestData.booksViewModels), .images(TestData.imagesViewModels)])

        // when
        let sections = presenterMock.viewModel!.sections
        let firstIndex = 0

        // then
        switch sections[firstIndex] {
        case let .books(books):
            XCTAssertEqual(viewController.tableView(tableView, numberOfRowsInSection: firstIndex), books.count)
        case let .images(images):
            XCTAssertEqual(viewController.tableView(tableView, numberOfRowsInSection: firstIndex), images.count)
        }
    }

    func test_cellForRow() {
        // given
        let tableView = viewController.tableView

        // when
        tableView.cellForRow(at: IndexPath(row: 0, section: 0))

        // then
        XCTAssertTrue(tableView.dequeueReusableCell(withIdentifier: BooksTableViewCell.description()) is BooksTableViewCell)
    }

    func test_didSelectRowAt() {
        // given
        presenterMock.viewModel = BooksViewControllerViewModel(sections: [.books(TestData.booksViewModels), .images(TestData.imagesViewModels)])
        let tableView = viewController.tableView
        let indexPath = IndexPath(row: 0, section: 0)

        // when
        viewController.tableView(tableView, didSelectRowAt: indexPath)

        // then
        switch presenterMock.viewModel!.sections[indexPath.section] {
        case .books(_):
            XCTAssertTrue(presenterMock.getBookIDForChaptersWasCalled)
        case .images(_): return
        }
    }
}

private extension BooksViewControllerTests {

    enum TestData {
        static let booksViewModels: [BooksViewModel] = [BooksViewModel(name: "")]
        static let imagesViewModels: [ImageViewModel] = []
    }
}
