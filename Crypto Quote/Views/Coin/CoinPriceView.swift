//
//  QuoteCurrentPrice.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/4/22.
//

import SwiftUI

struct CoinPriceView: View {
    @ObservedObject var viewModel: QuoteCoinViewModel

    var body: some View {
        Text(viewModel.currentPrice)
            .font(.title.bold())
            .frame(maxWidth: .infinity)
            .foregroundColor(viewModel.trendingUp24H ? .trendingUp : .trendingDown)
    }
}
