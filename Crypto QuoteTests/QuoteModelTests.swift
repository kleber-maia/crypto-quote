//
//  QuoteModelTests.swift
//  Crypto QuoteTests
//
//  Created by Kleber Maia on 5/1/22.
//

import XCTest
@testable import Crypto_Quote

class QuoteModelTests: XCTestCase {
    func testDecode() throws {
        // Arrange
        let data = try! Data(
            contentsOf: Bundle(for: QuoteModelTests.self).url(forResource: "quote", withExtension: "json")!
        )

        // Act
        let model = try! QuoteModel.decode(from: data)

        // Assert
        XCTAssert(model.data.count == 3)
        XCTAssert(model.data["BTC"]!.symbol == "BTC")
        XCTAssert(model.data["BTC"]!.name == "Bitcoin")
        XCTAssertEqual(model.data["BTC"]!.quote["USD"]!.price, 38255.09, accuracy: 2)

        XCTAssert(model.data["CEL"]!.symbol == "CEL")
        XCTAssert(model.data["CEL"]!.name == "Celsius")
        XCTAssertEqual(model.data["CEL"]!.quote["USD"]!.price, 2.03, accuracy: 2)

        XCTAssert(model.data["ETH"]!.symbol == "ETH")
        XCTAssert(model.data["ETH"]!.name == "Ethereum")
        XCTAssertEqual(model.data["ETH"]!.quote["USD"]!.price, 2805.14, accuracy: 2)
    }
}
