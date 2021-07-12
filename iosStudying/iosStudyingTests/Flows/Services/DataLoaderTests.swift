//
//  DataLoaderTests.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 12.07.2021.
//

import XCTest
@testable import iosStudying

class DataLoaderTests: XCTestCase {

    var dataLoader: DataLoader<String>!
    let key: String = "key"
    let value: String = "value"

    override func setUpWithError() throws {
        dataLoader = .init()
    }

    override func tearDownWithError() throws {
        dataLoader = nil
        UserDefaults.standard.removeObject(forKey: key)
    }

    func test_load_success() {
        // given
        let encoder = JSONEncoder()
        let data = try? encoder.encode(value)
        UserDefaults.standard.set(data, forKey: key)

        // when
        let result = dataLoader.load(key: key)

        // then
        XCTAssertEqual(result, value)
    }

    func test_load_failure() {
        // when
        let result = dataLoader.load(key: key)

        // then
        XCTAssertEqual(result, nil)
    }

    func test_save() {
        // given
        let decoder = JSONDecoder()

        // when
        dataLoader.save(value: value, key: key)

        // then
        guard let data = UserDefaults.standard.value(forKey: key) as? Data else { return }
        let result = try? decoder.decode(type(of: value), from: data)
        XCTAssertEqual(result, value)
    }

    func test_remove() {
        // when
        dataLoader.remove(key: key)

        // then
        let result = UserDefaults.standard.value(forKey: key)
        XCTAssertTrue(result == nil)
    }
}
