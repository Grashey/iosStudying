//
//  HTTPClient.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 02.06.2021.
//

import Foundation
import Alamofire

protocol HTTPClientProtocol {
    func request<ResponseType: Decodable>(for route: Route, completion: @escaping (Result<ResponseType, Error>) -> Void)
}

class HTTPClient: HTTPClientProtocol {

    let decoder = JSONDecoder()

    func request<ResponseType: Decodable>(for route: Route, completion: @escaping (Result<ResponseType, Error>) -> Void) {
        let request = AF.request(
            route.makeURL(),
            method: route.method,
            parameters: route.parameters,
            encoding: route.encoding,
            headers: route.headers
        )
        request.response { response in
            do {
                if let data = response.data {
                    let decoded = try self.decoder.decode(ResponseType.self, from: data)
                    completion(.success(decoded))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
}
