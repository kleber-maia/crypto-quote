//
//  QuoteViewModel.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/1/22.
//

import Foundation

class QuoteViewModel: ObservableObject {
    // TODO: This list should come from user defaults
    let symbols: [SymbolModel] = [
        .init(id: "BTC"),
        .init(id: "ETH"),
        .init(id: "BNB"),
        .init(id: "XRP"),
        .init(id: "SOL"),
        .init(id: "LUNA"),
        .init(id: "ADA"),
        .init(id: "DOGE"),
        .init(id: "AVAX"),
        .init(id: "DOT"),
        .init(id: "NEAR")
    ]

    /// View model containing details about the currently, selected symbol / coin.
    var coinViewModel: QuoteCoinViewModel? {
        guard let selectedSymbol = selectedSymbol,
              let infoModel = infoModel.data[selectedSymbol.id],
              let quoteModel = quoteModel.data[selectedSymbol.id] else {
            return nil
        }
        return QuoteCoinViewModel(infoCoinModel: infoModel, quoteCoinModel: quoteModel)
    }
    /// Symbol / coin to be presented to the user.
    @Published private(set) var selectedSymbol: SymbolModel?
    /// Represents the last time data was fetched from the API.
    @Published private(set) var lastUpdate: Date?
    /// Whether the ViewModel has data to present.
    @Published private(set) var ready = false
    /// Represents the error, if any, was last returned by the API.
    @Published private(set) var error: Error?

    private var rotateSymbolWork: DispatchWorkItem?
    private var infoModel = InfoModel(data: [String: InfoCoinModel]())
    private var quoteModel = QuoteModel(data: [String: QuoteCoinModel]())
    private var infoService: APIService<InfoModel>
    private var quoteService: APIService<QuoteModel>

    init(infoService: APIService<InfoModel> = APIService(), quoteService: APIService<QuoteModel> = APIService()) {
        self.infoService = infoService
        self.quoteService = quoteService
    }

    /// Returns, if any, the view model containing details about a given symbol / coin.
    func coinViewModel(for symbol: SymbolModel) -> QuoteCoinViewModel? {
        guard let infoModel = infoModel.data[symbol.id],
              let quoteModel = quoteModel.data[symbol.id] else {
            return nil
        }
        return QuoteCoinViewModel(infoCoinModel: infoModel, quoteCoinModel: quoteModel)
    }

    /// Starts refreshing the quotes from the server.
    func start() {
        refresh()
    }

    /// Returns the logo's URL for a given symbol.
    func logo(for symbol: SymbolModel) -> String? {
        infoModel.data[symbol.id]?.logo
    }

    /// Sets a given symbol as the one to be presented to the user.
    func selectSymbol(_ symbol: SymbolModel) {
        selectedSymbol = symbol

        let work = DispatchWorkItem { [weak self] in
            self?.rotateSymbol()
        }

        rotateSymbolWork?.cancel()
        rotateSymbolWork = nil
        rotateSymbolWork = work

        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: work)
    }

    /// Pulls refreshed data from the API.
    private func refresh() {
        Task { @MainActor in
            error = nil

            do {
                infoModel = try await infoService.fetch(symbols: symbols)

                quoteModel = try await quoteService.fetch(symbols: symbols)
                
                ready = true
            } catch {
                print(#file, #function, "error", error)

                self.error = error
            }

            if selectedSymbol == nil {
                rotateSymbol()
            }

            lastUpdate = Date.now

            DispatchQueue.main.asyncAfter(deadline: .now() + 60 * 15) { [weak self] in
                self?.refresh()
            }
        }
    }

    /// Rotates symbols presented to the user once we have data to be present.
    private func rotateSymbol() {
        // if we don't have more than one symbol, no need to schedule rotation
        guard symbols.count > 1 else {
            selectedSymbol = symbols.first
            return
        }

        // selects the next or goes back to the first symbol
        if let selectedSymbol = self.selectedSymbol, selectedSymbol != symbols.last,
           let selectedIndex = symbols.firstIndex(where: { $0 == selectedSymbol }) {
            selectSymbol(symbols[selectedIndex + 1])
        } else if let firstSymbol = symbols.first {
            selectSymbol(firstSymbol)
        }
    }
}
