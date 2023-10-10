//
//  QuoteCoinHeader.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/4/22.
//

import SwiftUI

/// A View for presenting logo and name of a given coin.
struct CoinHeaderView: View {
    @ObservedObject var viewModel: QuoteCoinViewModel

    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: URL(string: viewModel.logo))
                .font(.title)
                .imageScale(.large)

            Text(viewModel.name)
                .font(.title)
        }
    }
}
