//
//  LoginView.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 06.06.2021.
//

import UIKit

class LoginView: UIView {

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

    lazy var registryButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizible.registryButtonTitle(), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func configureContent() {
        self.backgroundColor = .white
        self.addSubview(loginTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registryButton)
        self.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -120),

            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -60),

            loginButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            registryButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 60),
            registryButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100),
            infoLabel.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -10)
        ])
    }
}
