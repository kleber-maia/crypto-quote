//
//  QuoteCoinTrendingList.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/4/22.
//

import SwiftUI

struct CoinTrendingListView: View {
    @ObservedObject var viewModel: QuoteCoinViewModel

    var body: some View {
        HStack {
            QuoteCoinTrendingItem(
                timeFrame: "quote_trend_period_1h",
                percentTrending: viewModel.percentChange1H,
                trendingUp: viewModel.trendingUp1H
            )

            QuoteCoinTrendingItem(
                timeFrame: "quote_trend_period_24h",
                percentTrending: viewModel.percentChange24H,
                trendingUp: viewModel.trendingUp24H
            )

            QuoteCoinTrendingItem(
                timeFrame: "quote_trend_period_7d",
                percentTrending: viewModel.percentChange7D,
                trendingUp: viewModel.trendingUp7D
            )

            QuoteCoinTrendingItem(
                timeFrame: "quote_trend_period_30d",
                percentTrending: viewModel.percentChange30D,
                trendingUp: viewModel.trendingUp30D
            )

            QuoteCoinTrendingItem(
                timeFrame: "quote_trend_period_60d",
                percentTrending: viewModel.percentChange60D,
                trendingUp: viewModel.trendingUp60D
            )

            QuoteCoinTrendingItem(
                timeFrame: "quote_trend_period_90d",
                percentTrending: viewModel.percentChange90D,
                trendingUp: viewModel.trendingUp90D
            )
        }
    }
}

struct QuoteCoinTrendingItem: View {
    var timeFrame: LocalizedStringKey
    var percentTrending: String
    var trendingUp: Bool

    var body: some View {
        VStack(spacing: 8) {
            Text(timeFrame)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .foregroundColor(.gray)

            if trendingUp {
                Image(systemName: Assets.trendingUpSymbol)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.trendingUp)
                    .font(.title)
            } else {
                Image(systemName: Assets.trendingDownSymbol)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.trendingDown)
                    .font(.title)
            }

            Text(percentTrending)
                .font(.headline.monospaced())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor(trendingUp ? .green : .red)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(.black.opacity(0.15))
        }
    }
}
