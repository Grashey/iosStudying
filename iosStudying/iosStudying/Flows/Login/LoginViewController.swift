//
//  LoginViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let service = AuthService()
    
    let borderWidth: CGFloat = 1
    let borderColor: UIColor = .lightGray
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.string.localizible.placeholderLogin()
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField .translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.string.localizible.placeholderPassword()
        textField.autocapitalizationType = .none
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField .translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizible.loginButtonTitle(), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizible.loginViewControllerTitle()
        configureContent()
        
        loginButton.addTarget(self, action: #selector(isButtonPressed), for: .touchUpInside)
    }
    
    private func configureContent() {
        self.view.backgroundColor = .white
        self.view.addSubview(loginTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            loginTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100),
            loginTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -120),
            
            passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -100),
            passwordTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -60),
            
            loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc func isButtonPressed() {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
        
        service.auth(login: login, password: password) { result in
            switch result {
            case let .success(token):
                print(token)
                DispatchQueue.main.async {
                    let vc = BooksViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    
}
