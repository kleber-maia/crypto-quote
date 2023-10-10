//
//  QuoteFooter.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/4/22.
//

import SwiftUI

struct FooterView: View {
    @ObservedObject var viewModel: QuoteViewModel

    var body: some View {
        if let lastUpdate = viewModel.lastUpdate {
            HStack(spacing: 8) {
                Text("quote_source")

                Spacer()

                Text(lastUpdate, style: .relative)

                Text("quote_updated_ago")
            }
            .font(.caption2)
            .foregroundColor(.gray)
        }
    }
}
