//
//  BooksViewControllerMock.swift
//  iosStudyingTests
//
//  Created by Aleksandr Fetisov on 05.07.2021.
//

import Foundation
@testable import iosStudying

class BooksViewControllerMock: BooksViewControllerProtocol {

    var invokedOnFinishFlowSetter = false
    var invokedOnFinishFlowSetterCount = 0
    var invokedOnFinishFlow: (() -> Void)?
    var invokedOnFinishFlowList = [(() -> Void)?]()
    var invokedOnFinishFlowGetter = false
    var invokedOnFinishFlowGetterCount = 0
    var stubbedOnFinishFlow: (() -> Void)!

    var onFinishFlow: (() -> Void)? {
        get {
            invokedOnFinishFlowGetter = true
            invokedOnFinishFlowGetterCount += 1
            return stubbedOnFinishFlow
        }
        set {
            invokedOnFinishFlowSetter = true
            invokedOnFinishFlowSetterCount += 1
            invokedOnFinishFlow = newValue
            invokedOnFinishFlowList.append(newValue)
        }
    }

    var invokedReload = false
    var invokedReloadCount = 0

    func reload() {
        invokedReload = true
        invokedReloadCount += 1
    }
}
