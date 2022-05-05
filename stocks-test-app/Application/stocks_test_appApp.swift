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
            #warning("Insert view here")
            Spacer()
                .onAppear {
                    QuotesManager().getMonthQuotes { monthQuotes in
                        print("Month quotes: \(monthQuotes)")
                    } failureCompletion: { error in
                        print("Error while getting month quotes")
                    }
                    
                    QuotesManager().getWeekQuotes { weekQuotes in
                        print("Week quotes: \(weekQuotes)")
                    } failureCompletion: { error in
                        print("Error while getting month quotes")
                    }
                }
        }
    }
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    
    // MARK: Private Function
}
