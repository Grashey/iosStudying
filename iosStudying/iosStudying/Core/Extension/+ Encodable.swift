//
//  + Encodable.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 08.06.2021.
//

import Foundation

extension Encodable {

    func toDict() -> [String: Any]? {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
