//
//  Crypto_QuoteApp.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/1/22.
//

import SwiftUI

@main
struct Crypto_QuoteApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(tvOS)
            RootViewTV()
            #else
            Text("Work in progress")
            #endif
        }
    }
}
