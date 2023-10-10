//
//  QuoteModel.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/1/22.
//

import Foundation

// MARK: - QuoteModel

struct QuoteModel: Model {
    let data: [String: QuoteCoinModel]

    /// Attempts to decode a `QuoteModel` from a JSON in the following format:
    /// ```
    /// {
    ///     "data": {
    ///         "BTC": { ... },
    ///         "ETC": { ... },
    ///         ...
    ///     }
    /// }
    /// ```
    static func decode(from data: Data) throws -> QuoteModel {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(QuoteModel.self, from: data)
    }
}

// MARK: - QuoteCoinModel

struct QuoteCoinModel: Codable {
    let id: Int
    let name: String
    let symbol: String
    let slug: String
    let numMarketPairs: Int
    let dateAdded: String
    let tags: [String]
    let maxSupply: Int?
    let circulatingSupply: Decimal
    let totalSupply: Decimal
    let isActive: Int
    let cmcRank: Int
    let isFiat: Int
    let selfReportedCirculatingSupply: Decimal?
    let selfReportedMarketCap: Decimal?
    let lastUpdated: String
    let quote: [String: QuotePriceModel]
}

// MARK: - QuotePriceModel
struct QuotePriceModel: Codable {
    let price: Decimal
    let volume24H: Decimal
    let volumeChange24H: Decimal
    let percentChange1H: Decimal
    let percentChange24H: Decimal
    let percentChange7D: Decimal
    let percentChange30D: Decimal
    let percentChange60D: Decimal
    let percentChange90D: Decimal
    let marketCap: Decimal
    let marketCapDominance: Decimal
    let fullyDilutedMarketCap: Decimal
    let lastUpdated: String
}
