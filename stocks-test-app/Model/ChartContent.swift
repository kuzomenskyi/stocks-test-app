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
    // MARK: Constant
    
    // MARK: Private Constant
    
    // MARK: Variable
    @Published var mode: ChartContent.Mode = .monthView
    @Published var title: String = ""
    @Published var subtitle: String = ""
    @Published var tooltipValueSuffix = "USD"
    @Published var quoteSymbols: [QuoteSymbol] = []

    lazy var categories: [String] = DateManager.shared.getMonthsTitles()
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    
    // MARK: Private Function
}
