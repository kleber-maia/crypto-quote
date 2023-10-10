//
//  QuoteCoinViewModelTests.swift
//  Crypto QuoteTests
//
//  Created by Kleber Maia on 5/1/22.
//

import XCTest
@testable import Crypto_Quote

class QuoteCoinViewModelTests: XCTestCase {
    func testProperties() throws {
        // Arrange
        let infoData = try! Data(
            contentsOf: Bundle(for: QuoteModelTests.self).url(forResource: "info", withExtension: "json")!
        )
        let quoteData = try! Data(
            contentsOf: Bundle(for: QuoteModelTests.self).url(forResource: "quote", withExtension: "json")!
        )

        let infoModel = try! InfoModel.decode(from: infoData)
        let quoteModel = try! QuoteModel.decode(from: quoteData)

        // Act
        let viewModel = QuoteCoinViewModel(
            infoCoinModel: infoModel.data["BTC"]!, quoteCoinModel: quoteModel.data["BTC"]!
        )

        // Assert
        XCTAssert(viewModel.percentChange1H == "1.04%")
        XCTAssert(viewModel.percentChange24H == "-0.22%")
        XCTAssert(viewModel.percentChange7D == "-3.19%")
        XCTAssert(viewModel.percentChange30D == "-17.17%")
        XCTAssert(viewModel.percentChange60D == "-12.67%")
        XCTAssert(viewModel.percentChange90D == "-0.53%")
    }
}
