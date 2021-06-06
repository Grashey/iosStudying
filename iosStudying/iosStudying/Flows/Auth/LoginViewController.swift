//
//  LoginViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    let service = AuthService()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
                print(token)
                DispatchQueue.main.async {
                    let vc = UITabBarController()
                    vc.viewControllers = [BooksViewController(), UIViewController()].map {
                        UINavigationController(rootViewController: $0)
                    }
                    UIApplication.shared.keyWindow?.rootViewController = vc
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
        let vc = RegistryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func hideKeyboard(){
           view.endEditing(true)
       }
}
