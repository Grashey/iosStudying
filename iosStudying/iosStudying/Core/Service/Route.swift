//
//  Route.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 02.06.2021.
//

import Alamofire
import KeychainSwift

protocol Route {
    
    var method: HTTPMethod { get }
    
    var url: String { get }
    
    var encoding: ParameterEncoding { get }
    
    var headers: HTTPHeaders { get }
    
    var baseURL: String { get }
    
    var parameters: [String: Any] { get }
    
    func makeURL() -> String
}

extension Route {
    
    var method: HTTPMethod { .get }
    
    var encoding: ParameterEncoding { URLEncoding.default }
    
    var baseURL: String { "https://the-one-api.dev/v2" }
    
    var headers: HTTPHeaders {
        if let token = KeychainSwift().get(KeychainSwift.Keys.token.rawValue) {
            return ["Authorization": "Bearer \(token)"]
        }
        return [:]
    }
    
    var parameters: [String: Any] { [:] }
    
    func makeURL() -> String {
        baseURL.appending(url)
    }
}
