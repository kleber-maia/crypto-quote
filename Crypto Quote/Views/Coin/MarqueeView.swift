//
//  QuoteCurrentPrice.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/4/22.
//

import Combine
import SwiftUI

struct MarqueeView: View {
    @ObservedObject var viewModel: QuoteViewModel
    var geometry: GeometryProxy

    @State private var offset = 0.0
    private let symbolWidth = CGFloat(175)
    private var totalWidth: CGFloat {
        CGFloat(viewModel.symbols.count) * symbolWidth
    }

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.symbols, id: \.self) { symbol in
                    if let coinViewModel = viewModel.coinViewModel(for: symbol) {
                        let trendingUp = coinViewModel.trendingUp24H
                        HStack(spacing: 8) {
                            if trendingUp {
                                Image(systemName: Assets.trendingUpSymbol)
                                    .symbolRenderingMode(.hierarchical)
                            } else {
                                Image(systemName: Assets.trendingDownSymbol)
                                    .symbolRenderingMode(.hierarchical)
                            }

                            Text(coinViewModel.currentPrice)
                        }
                        .foregroundColor(coinViewModel.trendingUp24H ? .trendingUp : .trendingDown)
                    }
                }
            }
            .offset(x: offset, y: 0.0)
        }
        .clipped()
        .onAppear {
            startMarquee()
        }
    }

    private func startMarquee() {
        offset = geometry.size.width

        withAnimation(.linear(duration: 25)) {
            self.offset = -(offset + totalWidth)
        } completion: {
            startMarquee()
        }
    }
}

struct HQuoteMarquee_Previews: PreviewProvider {
    static var viewModel = QuoteViewModel()

    static var previews: some View {
        GeometryReader { geometry in
            MarqueeView(viewModel: viewModel, geometry: geometry)
        }.onAppear {
            viewModel.start()
        }
    }
}
