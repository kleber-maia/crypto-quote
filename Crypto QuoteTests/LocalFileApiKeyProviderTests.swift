//
//  LocalFileApiKeyProviderTests.swift
//  Crypto QuoteTests
//
//  Created by Kleber Maia on 5/1/22.
//

import XCTest
@testable import Crypto_Quote

class LocalFileApiKeyProviderTests: XCTestCase {
    func testApiKey() throws {
        // Arrange
        let bundle = Bundle(for: Self.self)

        let provider = LocalFileApiKeyProvider(bundle: bundle, fileName: "FakeApiKey", fileExtension: "txt")

        // Act
        let actual = provider.apiKey

        // Assert
        XCTAssert(actual == "some-fake-api-key")
    }
}
