//
//  QuoteView.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/1/22.
//

import Combine
import SwiftUI

/// A View layout for Apple TV.
struct RootViewTV: View {
    @StateObject var viewModel = QuoteViewModel()

    var body: some View {
        GeometryReader { geometry in
            if let coinViewModel = viewModel.coinViewModel {
                HStack {
                    VStack(alignment: .leading) {
                        CoinHeaderView(viewModel: coinViewModel)

                        Spacer()

                        HStack() {
                            CoinPriceView(viewModel: coinViewModel)

                            CoinStatsGrid(viewModel: coinViewModel)
                        }

                        Spacer()

                        CoinTrendingListView(viewModel: coinViewModel)

                        MarqueeView(viewModel: viewModel, geometry: geometry)

                        Spacer()

                        FooterView(viewModel: viewModel)
                    }

                    SymbolListView(viewModel: viewModel)
                }
            }

        }
        .background {
            Image("wallpaper")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .overlay {
                    Rectangle()
                        .fill(.black.opacity(0))
                        .background(.thickMaterial)
                }
        }
        .overlay {
            if !viewModel.ready {

                ProgressView()

            } else if let error = viewModel.error {

                ErrorView(error: error)

            }
        }
        .onAppear {
            viewModel.start()
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        RootViewTV()
    }
}
