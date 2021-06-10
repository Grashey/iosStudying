//
//  NavigattionRouter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

class NavigationRouter {

    var controller: UIViewController?

    func show(_ controller: UIViewController) {
        self.controller?.show(controller, sender: nil)
    }

    func setAsRoot(_ controller: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = controller
    }

    func present(_ controller: UIViewController) {
        self.controller?.present(controller, animated: true, completion: nil)
    }
}
