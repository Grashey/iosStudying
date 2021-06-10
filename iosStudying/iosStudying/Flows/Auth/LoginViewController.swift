//
//  LoginViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit
import KeychainSwift

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    let service = AuthService()
    let router = AuthNavigationRouter()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        router.controller = self
        
        self.title = R.string.localizible.loginViewControllerTitle()
        
        loginView.loginButton.addTarget(self, action: #selector(isLoginButtonPressed), for: .touchUpInside)
        loginView.registryButton.addTarget(self, action: #selector(isRegistryButtonPressed), for: .touchUpInside)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGR)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.loginView.infoLabel.text?.removeAll()
        loginView.passwordTextField.text?.removeAll()
    }
    
    @objc func isLoginButtonPressed() {
        hideKeyboard()
        guard let login = loginView.loginTextField.text, let password = loginView.passwordTextField.text else { return }
        
        service.auth(login: login, password: password) { result in
            switch result {
            case let .success(token):
                KeychainSwift().set(token, forKey: KeychainSwift.Keys.token.rawValue)
                DispatchQueue.main.async {
                    self.router.toMain()
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    self.loginView.infoLabel.text = error.rawValue
                }
            }
        }
    }
    
    @objc func isRegistryButtonPressed() {
        hideKeyboard()
        router.toRegistry()
    }
    
    @objc private func hideKeyboard(){
           view.endEditing(true)
       }
}
