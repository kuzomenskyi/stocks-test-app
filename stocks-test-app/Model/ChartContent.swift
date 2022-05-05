//
//  ChartContent.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import Foundation

struct ChartContent {
    // MARK: Constant
    
    // MARK: Private Constant
    
    // MARK: Variable
    var title: String = ""
    var subtitle: String = ""
    var tooltipValueSuffix = "USD"
    var quoteSymbols: [QuoteSymbol] = []
    
    lazy var categories: [String] = DateManager.shared.getMonthsTitles()
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    
    // MARK: Private Function
}
