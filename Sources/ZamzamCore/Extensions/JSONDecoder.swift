//
//  JSONDecoder.swift
//  ZamzamCore
//
//  Created by Basem Emara on 2019-11-18.
//  Copyright © 2021 Zamzam Inc. All rights reserved.
//

import Foundation.NSJSONSerialization

public extension JSONDecoder {
    /// Decodes an instance of the indicated type.
    ///
    /// - Parameters:
    ///   - type: The type to decode.
    ///   - string: The string representation of the JSON object.
    func decode<T: Decodable>(_ type: T.Type, from string: String, using encoding: String.Encoding = .utf8) throws -> T {
        guard let data = string.data(using: encoding) else {
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: [],
                    debugDescription: "Could not encode data from string."
                )
            )
        }

        return try decode(type, from: data)
    }
}
