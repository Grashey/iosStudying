//
//  QuotesViewControllerTests.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 07.07.2021.
//

import XCTest
@testable import iosStudying

class QuotesViewControllerTests: XCTestCase {

    var viewController: QuotesViewController!
    var presenterMock: QuotesPresenterMock!

    override func setUpWithError() throws {
        viewController = QuotesViewController()
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
        XCTAssertTrue(tableView.refreshControl != nil)
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
        XCTAssertEqual(viewController.title, R.string.localizible.quotesViewControllerTitle())
        XCTAssertTrue(presenterMock.loadNextWasLoaded)
    }

    func test_refreshQuotes() {
        // given
        let refreshControl = viewController.tableView.refreshControl!

        // when
        viewController.refreshQuotes(refreshControl)

        // then
        XCTAssertTrue(presenterMock.removeAllWasLoaded)
        XCTAssertTrue(presenterMock.loadNextWasLoaded)
    }

    func test_tableViewNumberOfRowsInSection() {
        // given
        let tableView = viewController.tableView

        // when
        let models = presenterMock.viewModels

        // then
        XCTAssertEqual(viewController.tableView(tableView, numberOfRowsInSection: 0), models.count)
    }

    func test_cellForRow() {
        // given
        let tableView = viewController.tableView

        // when
        tableView.cellForRow(at: IndexPath(row: 0, section: 0))

        // then
        XCTAssertTrue(tableView.dequeueReusableCell(withIdentifier: QuoteTableViewCell.description()) is QuoteTableViewCell)
    }

    func test_didSelectRowAt() {
        // given
        let tableView = viewController.tableView

        // when
        viewController.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))

        // then
        XCTAssertTrue(presenterMock.operateFavoriteWasLoaded)
    }
}
