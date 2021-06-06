//
//  LoginViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let borderWidth: CGFloat = 1
    let borderColor: UIColor = .lightGray
    
    lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = borderWidth
        textField.layer.borderColor = borderColor.cgColor
        textField .translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
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
        let vc = BooksViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
