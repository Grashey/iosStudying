//
//  AuthService.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 06.06.2021.
//

import Foundation

enum AuthError: String, Error {
    case noSuchUser = "User not found"
    case userIsEmpty = "Enter login"
    case wrongPassword = "Wrong password"
    case passwordIsEmpty = "Enter password"

}

class AuthService {

    let defaults = UserDefaults.standard

    func auth(login: String, password: String, completion: @escaping (Result<String, AuthError>) -> Void) {
        DispatchQueue.global().async {
            sleep(2)

            guard !login.isEmpty else { return completion(.failure(.userIsEmpty)) }
            guard let passwordValue = self.defaults.value(forKey: login) as? String else { return completion(.failure(.noSuchUser)) }

            if password == passwordValue {
                self.defaults.set(true, forKey: PublicConstants.authKey)
                completion(.success(PublicConstants.token))
            } else if password.isEmpty {
                completion(.failure(.passwordIsEmpty))
            } else {
                completion(.failure(.wrongPassword))
            }
        }
    }

    // нет проверок на наличие значения полей и уровней сложности пароля, пароль обновляется для существующего юзера
    func register(login: String, password: String, completion: @escaping (Result<String, AuthError>) -> Void) {
        DispatchQueue.global().async {
            sleep(2)

            self.defaults.set(true, forKey: PublicConstants.authKey)
            self.defaults.set(password, forKey: login)
            completion(.success(PublicConstants.token))
        }
    }
}
