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

    func test_tableViewDataSource() {
        // given
        let tableView = viewController.tableView
        tableView.dataSource = viewController
        let booksViewModels: [BooksViewModel] = []
        let imagesViewModels: [ImageViewModel] = []
        presenterMock.viewModel = BooksViewControllerViewModel(sections: [.books(booksViewModels), .images(imagesViewModels)])

        // when
        let sections = presenterMock.viewModel!.sections

        // then
        XCTAssertEqual(viewController.numberOfSections(in: tableView), sections.count)
        XCTAssertEqual(viewController.tableView(tableView, numberOfRowsInSection: 0), booksViewModels.count)
        XCTAssertEqual(viewController.tableView(tableView, numberOfRowsInSection: 1), imagesViewModels.count)
    }
}
