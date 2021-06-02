//
//  Route.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 02.06.2021.
//

import Alamofire

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
    
    var baseURL: String { "https://the-one-api.dev/" }
    
    var headers: HTTPHeaders { [:] }
    
    var parameters: [String: Any] { [:] }
    
    func makeURL() -> String {
        baseURL.appending(url)
    }
}
