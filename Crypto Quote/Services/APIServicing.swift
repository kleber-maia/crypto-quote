//
//  InfoService.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/2/22.
//

import Foundation
import SwiftUI

/// Protocol definiing a utility capable of fetching data from the remote API.
protocol APIServicing {
    associatedtype Model

    func fetch(symbols: [SymbolModel]) async throws -> Model
}
