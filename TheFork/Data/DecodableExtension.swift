//
//  DecodableExtension.swift
//  TheFork
//
//  Created by Oscar on 5/03/22.
//

import Foundation

extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}
