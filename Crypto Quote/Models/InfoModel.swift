//
//  QuoteModel.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/2/22.
//

import Foundation

// MARK: - InfoModel

struct InfoModel: Model {
    let data: [String: InfoCoinModel]

    /// Attempts to decode an `InfoModel` from a JSON in the following format:
    /// ```
    /// {
    ///     "data": {
    ///         "BTC": { ... },
    ///         "ETC": { ... },
    ///         ...
    ///     }
    /// }
    /// ```
    static func decode(from data: Data) throws -> InfoModel {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(InfoModel.self, from: data)
    }
}

// MARK: - InfoCoinModel

struct InfoCoinModel: Codable {
    let id: Int
    let name: String
    let symbol: String
    let category: String
    let description: String
    let slug: String
    let logo: String
}
