//
//  stocks_test_appApp.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import SwiftUI

@main
struct stocks_test_appApp: App {
    // MARK: Constant
    
    // MARK: Private Constant
    
    // MARK: Variable
    
    var body: some Scene {
        WindowGroup {
            ComparisonView(weekChartContent: ChartContent()
                            .stockDisplayMode(.openPrices)
                            .mode(.weekView),
                           monthChartContent:
                            ChartContent()
                            .stockDisplayMode(.openPrices))
        }
    }
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    
    // MARK: Private Function
}
