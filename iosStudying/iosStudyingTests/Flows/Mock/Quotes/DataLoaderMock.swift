//
//  DataLoaderMock.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 08.07.2021.
//

import Foundation
@testable import iosStudying

class DataLoaderMock: DataLoaderProtocol {

    typealias DataType = String

    var invokedLoad = false
    var invokedLoadCount = 0
    var invokedLoadParameters: (key: String, Void)?
    var invokedLoadParametersList = [(key: String, Void)]()
    var stubbedLoadResult: DataType!

    func load(key: String) -> DataType? {
        invokedLoad = true
        invokedLoadCount += 1
        invokedLoadParameters = (key, ())
        invokedLoadParametersList.append((key, ()))
        return stubbedLoadResult
    }

    var invokedSave = false
    var invokedSaveCount = 0
    var invokedSaveParameters: (value: DataType, key: String)?
    var invokedSaveParametersList = [(value: DataType, key: String)]()

    func save(value: DataType, key: String) {
        invokedSave = true
        invokedSaveCount += 1
        invokedSaveParameters = (value, key)
        invokedSaveParametersList.append((value, key))
    }

    var invokedRemove = false
    var invokedRemoveCount = 0
    var invokedRemoveParameters: (key: String, Void)?
    var invokedRemoveParametersList = [(key: String, Void)]()

    func remove(key: String) {
        invokedRemove = true
        invokedRemoveCount += 1
        invokedRemoveParameters = (key, ())
        invokedRemoveParametersList.append((key, ()))
    }
}
