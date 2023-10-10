//
//  QuoteCoinItem.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/4/22.
//

import SwiftUI

struct CoinStatsGrid: View {
    @ObservedObject var viewModel: QuoteCoinViewModel

    var body: some View {
        VStack(spacing: 60) {
            HStack {
                QuoteCoinStatItem(title: "quote_market_capit", value: viewModel.marketCap)

                QuoteCoinStatItem(
                    title: "quote_circulating_supply",
                    value: viewModel.circulatingSupply,
                    subValue: viewModel.percentCirculatingSupply
                )
            }

            HStack {
                QuoteCoinStatItem(
                    title: "quote_volume_24h",
                    value: viewModel.volume24h,
                    subValue: viewModel.volume24hCoin
                )

                QuoteCoinStatItem(
                    title: "quote_max_supply",
                    value: viewModel.maxSupply
                )
            }
        }
    }
}

struct QuoteCoinStatItem: View {
    var title: LocalizedStringKey
    var value: String
    var subValue: String?

    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .foregroundColor(.gray)

            Text(subValue ?? " ")
                .font(.body.monospaced())
                .lineLimit(1)
                .truncationMode(.middle)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .trailing)

            Text(value)
                .font(.body.monospaced())
                .lineLimit(1)
                .truncationMode(.middle)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 30)
                .fill(.black.opacity(0.15))
        }
    }
}
