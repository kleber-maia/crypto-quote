//
//  ApiKeyProviding.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/1/22.
//

import Foundation

/// Represents a type capable of providing a key for accessing the remote API.
protocol ApiKeyProviding {
    var apiKey: String { get }
}
