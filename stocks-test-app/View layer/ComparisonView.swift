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
    @State var weekChartContent: ChartContent
    @State var isErrorAlertDisplayed = false
    @State var errorMessage = ""
    @State var monthChartContent: ChartContent
    @State var isMonthViewDisplayed = true
    
    // MARK: Private Constant
    private let quotesManager = QuotesManager()
    
    // MARK: Variable
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack {
                Spacer()
                    .frame(height: 15)
                HStack {
                    Spacer()
                        .frame(width: size.width * 0.05)
                    Toggle(isOn: Binding(get: {
                        var content: ChartContent {
                            if isMonthViewDisplayed {
                                return monthChartContent
                            } else {
                                return weekChartContent
                            }
                        }
                        
                        return content.stockDisplayMode == .performancePercentages
                    }, set: { newValue in
                        if isMonthViewDisplayed {
                            monthChartContent.stockDisplayMode = newValue ? .performancePercentages : .openPrices
                        } else {
                            weekChartContent.stockDisplayMode = newValue ? .performancePercentages : .openPrices
                        }
                        NotificationCenter.default.post(name: .didFetchMonthQuotes, object: self)
                    })) {
                        Text("Display performance percentage")
                    }
                    Spacer()
                        .frame(width: size.width * 0.05)
                }
                
                Spacer()
                    .frame(height: 15)
                if isMonthViewDisplayed {
                    ChartView(chartContent: $monthChartContent, chartModel: .constant(ChartView.getChartModel(forChartContent: monthChartContent)))
                        .subscribeForUpdates()
                        .alert(errorMessage, isPresented: $isErrorAlertDisplayed) {
                            Button("OK") {
                                // alert get's dismissed by tap on the button
                            }
                        }
                        .frame(height: size.height * 0.8)
                } else {
                    ChartView(chartContent: $weekChartContent, chartModel: .constant(ChartView.getChartModel(forChartContent: weekChartContent)))
                        .subscribeForUpdates()
                        .alert(errorMessage, isPresented: $isErrorAlertDisplayed) {
                            Button("OK") {
                                // alert get's dismissed by tap on the button
                            }
                        }
                        .frame(height: size.height * 0.8)
                }
                Spacer()
                    .frame(height: size.height * 0.01)
                
                
                HStack(spacing: size.width * 0.02) {
                    let size = geometry.size
                    
                    Spacer()
                    Button {
                        isMonthViewDisplayed = true
                    } label: {
                        Text("Monthly chart")
                            .padding(15)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(size.height * 0.5)
                            .frame(width: size.width * 0.4, height: size.height * 0.05)
                    }
                    
                    Button {
                        isMonthViewDisplayed = false
                    } label: {
                        Text("Weekly chart")
                            .padding(15)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .cornerRadius(size.height * 0.5)
                            .frame(width: size.width * 0.4, height: size.height * 0.05)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 15)
            }
        }
        .onAppear {
            quotesManager.getMonthQuotes { monthQuotes in
                monthChartContent.quoteSymbols = monthQuotes.content.quoteSymbols
                monthChartContent.title = DateManager.shared.getMonthTitle(fromDate: Date())
                monthChartContent.subtitle = "Last month view"
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
            
            quotesManager.getWeekQuotes { quotes in
                weekChartContent.quoteSymbols = quotes.content.quoteSymbols
                
                weekChartContent.title = "Week"
                weekChartContent.subtitle = "Week view"
                
                let categories = DateManager.shared.getDayTitles(forFirstDayOfWeek: .sunday)
                weekChartContent.categories = categories
                
                NotificationCenter.default.post(name: .didFetchMonthQuotes, object: self)
            } failureCompletion: { error in
                errorMessage = error.localizedDescription
                isErrorAlertDisplayed.toggle()
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
        ComparisonView(weekChartContent: ChartContent(), monthChartContent: ChartContent())
    }
}
