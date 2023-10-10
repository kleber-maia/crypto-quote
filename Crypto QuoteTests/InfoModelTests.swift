//
//  QuoteModelTests.swift
//  Crypto QuoteTests
//
//  Created by Kleber Maia on 5/1/22.
//

import XCTest
@testable import Crypto_Quote

class InfoModelTests: XCTestCase {
    func testDecode() throws {
        // Arrange
        let data = try! Data(
            contentsOf: Bundle(for: InfoModelTests.self).url(forResource: "info", withExtension: "json")!
        )

        // Act
        let model = try! InfoModel.decode(from: data)

        // Assert
        XCTAssert(model.data.count == 3)
        XCTAssert(model.data["BTC"]!.symbol == "BTC")
        XCTAssert(model.data["BTC"]!.name == "Bitcoin")

        XCTAssert(model.data["CEL"]!.symbol == "CEL")
        XCTAssert(model.data["CEL"]!.name == "Celsius")

        XCTAssert(model.data["ETH"]!.symbol == "ETH")
        XCTAssert(model.data["ETH"]!.name == "Ethereum")
    }
}
