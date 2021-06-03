//
//  LoginViewController.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 31.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginTextField: UITextField!
    var passwordTextField: UITextField!
    var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = R.string.localizible.loginViewControllerTitle()
        configureContent()
        
        loginButton.addTarget(self, action: #selector(isButtonPressed), for: .touchUpInside)
    }
    
    private func configureContent() {
        self.view.backgroundColor = .white
        
        let borderWidth: CGFloat = 1
        let borderColor : UIColor = .lightGray
        
        loginTextField = UITextField()
        loginTextField.layer.borderWidth = borderWidth
        loginTextField.layer.borderColor = borderColor.cgColor
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginTextField)
        
        passwordTextField = UITextField()
        passwordTextField.layer.borderWidth = borderWidth
        passwordTextField.layer.borderColor = borderColor.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(passwordTextField)
        
        loginButton = UIButton()
        loginButton.setTitle(R.string.localizible.loginButtonTitle(), for: .normal)
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
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
