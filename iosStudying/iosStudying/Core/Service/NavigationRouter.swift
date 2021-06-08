//
//  NavigattionRouter.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import UIKit

class NavigationRouter: NSObject {
    
    var controller: UIViewController? = nil
    
    func show(_ controller: UIViewController) {
        self.controller?.show(controller, sender: nil)
    }
    
    func setAsRoot(_ controller: UIViewController) {
        UIApplication.shared.keyWindow?.rootViewController = controller
    }
}
