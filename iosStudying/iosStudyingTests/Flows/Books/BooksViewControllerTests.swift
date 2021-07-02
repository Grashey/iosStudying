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
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_tableView() {
        // when
        let table = viewController.tableView

        // then
        XCTAssertTrue(viewController === table.dataSource)
        XCTAssertTrue(viewController === table.delegate)
    }

    func test_loadView() {
        XCTAssertEqual(viewController.view, viewController.tableView)
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
}
