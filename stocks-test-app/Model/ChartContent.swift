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
        switch stockDisplayMode {
        case .openPrices:
            let output = quoteSymbols.first?.opens ?? []
            return output
        case .performancePercentages:
            let output = quoteSymbols.first?.opensPerformance ?? []
            return output
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
    
    // MARK: Private Function
}
