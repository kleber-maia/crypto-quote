//
//  LocalFileApiKeyProvider.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/1/22.
//

import Foundation

/// Fetches the locally stored API key.
class LocalFileApiKeyProvider: ApiKeyProviding {
    private var bundle: Bundle
    private var fileName: String
    private var fileExtension: String

    init(bundle: Bundle = .main, fileName: String = "ApiKey", fileExtension: String = "txt") {
        self.bundle = bundle
        self.fileName = fileName
        self.fileExtension = fileExtension
    }

    var apiKey: String {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            preconditionFailure("Add ApiKey.txt file to this target and paste your API key.")
        }

        return try! String(contentsOf: url).trimmingCharacters(in: ["\n", "\r", " "])
    }
}
