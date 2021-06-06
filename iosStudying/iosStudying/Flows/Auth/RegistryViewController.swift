//
//  RegistryViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 06.06.2021.
//

import UIKit

class RegistryViewController: UIViewController {

    let registryView = RegistryView()
    
    let service = AuthService()
    
    override func loadView() {
        self.view = registryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizible.loginViewControllerTitle()
        
        registryView.registryButton.addTarget(self, action: #selector(isButtonPressed), for: .touchUpInside)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGR)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        registryView.loginTextField.text?.removeAll()
        registryView.passwordTextField.text?.removeAll()
    }
    
    @objc func isButtonPressed() {
        hideKeyboard()
        guard let login = registryView.loginTextField.text, let password = registryView.passwordTextField.text else { return }
        
        service.register(login: login, password: password) { result in
            switch result {
            case let .success(token):
                print(token)
                DispatchQueue.main.async {
                    let vc = UITabBarController()
                    vc.viewControllers = [BooksViewController(), UIViewController()].map {
                        UINavigationController(rootViewController: $0)
                    }
                    UIApplication.shared.keyWindow?.rootViewController = vc
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    @objc private func hideKeyboard(){
           view.endEditing(true)
       }
}
