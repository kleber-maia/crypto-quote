//
//  QuoteCoinViewModel.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/2/22.
//

import Foundation

class QuoteCoinViewModel: ObservableObject {
    var circulatingSupply: String {
        "\(quoteCoinModel.circulatingSupply.formatted(.number.notation(.compactName))) \(symbol)"
    }

    var currentPrice: String {
        "1 \(infoCoinModel.symbol) = \(price.price.formatted(.currency(code: "USD")))"
    }

    var name: String {
        infoCoinModel.name
    }

    var symbol: String {
        infoCoinModel.symbol
    }

    var logo: String {
        infoCoinModel.logo
    }

    var marketCap: String {
        "$\(price.marketCap.formatted(.number.notation(.compactName)))"
    }

    var maxSupply: String {
        if let max = quoteCoinModel.maxSupply {
            return "\(max.formatted(.number.notation(.compactName))) \(symbol)"
        } else {
            return "--"
        }
    }

    var percentCirculatingSupply: String {
        let max = Decimal(quoteCoinModel.maxSupply ?? 0)
        let percent = max > 0 ? quoteCoinModel.circulatingSupply / max : 0
        if percent > 0 {
            return percent.formatted(.percent.precision(.fractionLength(2)))
        } else {
            return "--"
        }
    }

    var percentChange1H: String {
        (price.percentChange1H / 100).formatted(.percent.precision(.fractionLength(2)))
    }

    var percentChange24H: String {
        (price.percentChange24H / 100).formatted(.percent.precision(.fractionLength(2)))
    }

    var percentChange7D: String {
        (price.percentChange7D / 100).formatted(.percent.precision(.fractionLength(2)))
    }

    var percentChange30D: String {
        (price.percentChange30D / 100).formatted(.percent.precision(.fractionLength(2)))
    }

    var percentChange60D: String {
        (price.percentChange60D / 100).formatted(.percent.precision(.fractionLength(2)))
    }

    var percentChange90D: String {
        (price.percentChange90D / 100).formatted(.percent.precision(.fractionLength(2)))
    }

    var trendingUp1H: Bool {
        price.percentChange1H >= 0
    }

    var trendingUp24H: Bool {
        price.percentChange24H >= 0
    }

    var trendingUp7D: Bool {
        price.percentChange7D >= 0
    }

    var trendingUp30D: Bool {
        price.percentChange30D >= 0
    }

    var trendingUp60D: Bool {
        price.percentChange60D >= 0
    }

    var trendingUp90D: Bool {
        price.percentChange90D >= 0
    }

    var volume24hCoin: String {
        let total = price.volume24H / price.price
        return "\(total.formatted(.number.notation(.compactName))) \(symbol)"
    }

    var volume24h: String {
        "$\(price.volume24H.formatted(.number.notation(.compactName)))"
    }

    private let infoCoinModel: InfoCoinModel
    private let quoteCoinModel: QuoteCoinModel
    private let price: QuotePriceModel

    init(infoCoinModel: InfoCoinModel, quoteCoinModel: QuoteCoinModel) {
        self.infoCoinModel = infoCoinModel
        self.quoteCoinModel = quoteCoinModel

        self.price = quoteCoinModel.quote.values.first.unsafelyUnwrapped
    }
}

