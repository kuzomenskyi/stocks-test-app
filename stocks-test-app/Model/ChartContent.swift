//
//  ChartContent.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import Foundation

class ChartContent: ObservableObject {
    enum Mode {
        case monthView, weekView
    }
    
    enum StocksDisplayMode {
        case performancePercentages, openPrices
    }
    
    // MARK: Constant
    
    // MARK: Private Constant
    
    // MARK: Variable
    @Published var mode: ChartContent.Mode = .monthView
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var quoteSymbols: [QuoteSymbol] = []
    @Published var stockDisplayMode: ChartContent.StocksDisplayMode = .openPrices
    var categories: [String] = []
    
    var stocksData: [Any] {
        var output: [Any] {
            switch stockDisplayMode {
            case .openPrices:
                let output = quoteSymbols.last?.opens ?? []
                return output
            case .performancePercentages:
                let output = quoteSymbols.last?.opensPerformance ?? []
                return output
            }
        }
        
        if mode == .monthView {
            return output
        } else {
            // cutting out all other data than for single week, as requested by client
            return output.chunked(into: 7).first ?? []
        }
    }
    
    var tooltipValueSuffix: String {
        switch stockDisplayMode {
        case .openPrices:
            return "USD"
        case .performancePercentages:
            return "%"
        }
    }
    

    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    @discardableResult
    func stockDisplayMode(_ mode: ChartContent.StocksDisplayMode) -> ChartContent {
        self.stockDisplayMode = mode
        return self
    }
    
    @discardableResult
    func mode(_ mode: ChartContent.Mode) -> ChartContent {
        self.mode = mode
        return self
    }
    
    // MARK: Private Function
}
