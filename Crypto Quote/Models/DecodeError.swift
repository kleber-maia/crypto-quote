//
//  DecodeError.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/1/22.
//

import Foundation

enum DecodeError: Error {
    case invalidFormat(key: String)
}
