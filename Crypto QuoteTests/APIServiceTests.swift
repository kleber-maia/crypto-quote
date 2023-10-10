//
//  APIServiceTests.swift
//  Crypto QuoteTests
//
//  Created by Kleber Maia on 5/2/22.
//

import XCTest
@testable import Crypto_Quote

class APIServiceTests: XCTestCase {
    func testFetchInfo() async throws {
        // Arrange
        let service = APIService<InfoModel>()

        // Act
        let model = try await service.fetch(symbols: [.init(id: "BTC"), .init(id: "CEL"), .init(id: "ETH")])

        // Assert
        XCTAssert(model.data.count == 3)
        XCTAssert(model.data["BTC"]!.symbol == "BTC")
        XCTAssert(model.data["CEL"]!.symbol == "CEL")
        XCTAssert(model.data["ETH"]!.symbol == "ETH")
    }

    func testFetchQuote() async throws {
        // Arrange
        let service = APIService<QuoteModel>()

        // Act
        let model = try await service.fetch(symbols: [.init(id: "BTC"), .init(id: "CEL"), .init(id: "ETH")])

        // Assert
        XCTAssert(model.data.count == 3)
        XCTAssert(model.data["BTC"]!.symbol == "BTC")
        XCTAssert(model.data["CEL"]!.symbol == "CEL")
        XCTAssert(model.data["ETH"]!.symbol == "ETH")
    }
}
