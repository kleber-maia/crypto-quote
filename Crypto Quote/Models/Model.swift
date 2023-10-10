//
//  Model.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/2/22.
//

import Foundation

/// Represents a protocol where all models should conform with.
protocol Model where Self: Decodable {
    static func decode(from data: Data) throws -> Self
}
