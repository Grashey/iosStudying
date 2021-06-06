//
//  AuthService.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 06.06.2021.
//

import Foundation

enum AuthError: Error {
    case noSuchUser
    case wrongPassword
}

class AuthService {
    
    let defaults = UserDefaults.standard

    func auth(login: String, password: String, completion: @escaping (Result<String, AuthError>) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            self.defaults.set("123", forKey: "Smith")
            if let passwordValue = self.defaults.value(forKey: login) as? String {
                if password == passwordValue {
                    completion(.success(R.string.localizible.token()))
                } else {
                    completion(.failure(.wrongPassword))
                }
            } else {
                completion(.failure(.noSuchUser))
            }
        }
    }
    
    func register(login: String, password: String) {
        switch defaults.bool(forKey: login) {
        case true:
            print("User named \(login) already exists")
        case false:
            defaults.set(true, forKey: login)
            defaults.set(password, forKey: login)
            print("New user named \(login) is registered")
        }
    }

}
