//
//  DataLoader.swift
//  iosStudying
//
//  Created by Aleksandr Fetisov on 11.06.2021.
//

import Foundation

protocol DataLoaderProtocol {

    associatedtype DataType

    func load(key: String) -> DataType?
    func save(value: DataType, key: String)
    func remove(key: String)
}

class DataLoader<DataType: Codable>: DataLoaderProtocol {

    let defaults = UserDefaults.standard

    func load(key: String) -> DataType? {
        let decoder = JSONDecoder()
        guard let data = defaults.value(forKey: key) as? Data else { return nil }
        let result = try? decoder.decode(DataType.self, from: data)
        return result
    }

    func save(value: DataType, key: String) {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(value)
        defaults.set(data, forKey: key)
    }

    func remove(key: String) {
        defaults.removeObject(forKey: key)
    }
}
