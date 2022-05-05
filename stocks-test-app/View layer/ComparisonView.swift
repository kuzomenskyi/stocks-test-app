//
//  ComparisonView.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import SwiftUI
import AAInfographics

struct ComparisonView: View {
    // MARK: Constant
    @State var monthChartContent: ChartContent
    @State var weekChartContent: ChartContent
    @State var isErrorAlertDisplayed = false
    @State var errorMessage = ""
    
    // MARK: Private Constant
    private let quotesManager = QuotesManager()
    
    // MARK: Variable
    var body: some View {
        ChartView(chartContent: $monthChartContent, chartModel: .constant(ChartView.getChartModel(forChartContent: monthChartContent)))
            .subscribeForUpdates()
            .onAppear {
                quotesManager.getMonthQuotes { monthQuotes in
                    monthChartContent.quoteSymbols = monthQuotes.content.quoteSymbols
                    monthChartContent.title = DateManager.shared.getMonthTitle(fromDate: Date())
                    monthChartContent.subtitle = "Monthly view"
                    monthChartContent.categories = []

                    if monthChartContent.quoteSymbols.count > 0 {
                        var categories = [String]()
                        for day in 1...monthChartContent.quoteSymbols.count {
                            categories.append("\(day)")
                        }
                        
                        monthChartContent.categories = categories
                    }
                    NotificationCenter.default.post(name: .didFetchMonthQuotes, object: self)
                } failureCompletion: { error in
                    errorMessage = error.localizedDescription
                    isErrorAlertDisplayed.toggle()
                }
            }
            .alert(errorMessage, isPresented: $isErrorAlertDisplayed) {
                Button("OK") {
                    // alert get's dismissed by tap on the button
                }
            }
        
        #warning("Add week ChartView")
    }
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    
    // MARK: Private Function
}

struct ComparisonView_Previews: PreviewProvider {
    static var previews: some View {
        ComparisonView(monthChartContent: ChartContent(), weekChartContent: ChartContent())
    }
}
