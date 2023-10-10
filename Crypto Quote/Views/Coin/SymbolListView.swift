//
//  QuoteSymbolsBar.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/4/22.
//

import SwiftUI

/// A selectable list of coins represented by their logos.
struct SymbolListView: View {
    @ObservedObject var viewModel: QuoteViewModel

    @FocusState private var selectedSymbol: SymbolModel?

    var body: some View {
        ScrollView(.vertical) {
            ForEach(viewModel.symbols) { symbol in
                if let logo = viewModel.logo(for: symbol) {
                    Button {
                        viewModel.selectSymbol(symbol)
                    } label: {
                        AsyncImage(url: URL(string: logo))
                            .frame(width: 60, height: 60)
                            .padding()
                    }
                    .buttonStyle(.card)
                    .focused($selectedSymbol, equals: symbol)
                }
            }
            .frame(maxWidth: 120)
        }
        .onChange(of: viewModel.selectedSymbol) { _, newValue in
            selectedSymbol = newValue
        }
    }
}
