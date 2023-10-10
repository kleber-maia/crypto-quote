//
//  InfoService.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/2/22.
//

import Foundation
import SwiftUI

/// Concrete implementation of a utility capable of fetching data from the remote API.
class APIService<T>: APIServicing where T: Model {
    typealias Model = T

    private var session: URLSession
    private var apiKeyProviding: ApiKeyProviding

    private var convert: Bool {
        switch T.self {
        case is InfoModel.Type:
            return false
        case is QuoteModel.Type:
            return true
        default:
            preconditionFailure("missing model evaluation")
        }
    }
    private var route: String {
        switch T.self {
        case is InfoModel.Type:
            return "v1/cryptocurrency/info"
        case is QuoteModel.Type:
            return "v1/cryptocurrency/quotes/latest"
        default:
            preconditionFailure("missing model evaluation")
        }
    }

    init(session: URLSession = .shared, apiKeyProviding: ApiKeyProviding = LocalFileApiKeyProvider()) {
        self.session = session
        self.apiKeyProviding = apiKeyProviding
    }

    /// Fetches API and requests the associated model's data.
    /// - Parameter symbols: BTC, ETH, CEL, etc...
    func fetch(symbols: [SymbolModel]) async throws -> T {
        let (data, urlResponse) = try await session.data(
            for: buildFetchRequest(symbols: symbols)
        )

        guard (urlResponse as? HTTPURLResponse)?.statusCode == 200 else {
            throw ServiceError.httpError
        }

        return try T.decode(from: data)
    }

    private func buildFetchRequest(symbols: [SymbolModel]) -> URLRequest {
        var components = URLComponents(
            string: "https://pro-api.coinmarketcap.com/\(route)"
        )
        components?.queryItems = [
            URLQueryItem(name: "symbol", value: symbols.map{$0.id}.joined(separator: ","))
        ]

        if convert {
            components?.queryItems?.append(
                URLQueryItem(name: "convert", value: "USD")
            )
        }

        guard let url = components?.url else {
            preconditionFailure("should not fail, since URL is under test")
        }

        var request = URLRequest(url: url)
        request.setValue(apiKeyProviding.apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        return request
    }
}
