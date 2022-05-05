//
//  ChartView.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import UIKit
import SwiftUI
import AAInfographics

struct ChartView: UIViewRepresentable {
    // MARK: Constant
    
    // MARK: Private Constant
    
    // MARK: Variable
    @Binding var chartContent: ChartContent
    @Binding var chartModel: AAChartModel
    var chart = AAChartView()
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    static func getChartModel(forChartContent chartContent: ChartContent) -> AAChartModel {
        let colorHexStrings = chartContent.quoteSymbols.map { $0.colorHexString }
        let series = ChartView.getSeries(forChartContent: chartContent)
        
        let model = AAChartModel()
            .chartType(.column)
            .animationType(.bounce)
            .title(chartContent.title)
            .subtitle(chartContent.subtitle)
            .dataLabelsEnabled(true)
            .tooltipValueSuffix(chartContent.tooltipValueSuffix)
            .categories(chartContent.categories)
            .colorsTheme(colorHexStrings)
            .series(series)
        
        return model
    }
    
    static func getSeries(forChartContent chartContent: ChartContent) -> [AASeriesElement] {
        let data = chartContent.stocksData
        print("data:", data.count)
        
        let series = chartContent.quoteSymbols.map { quoteSymbol -> AASeriesElement in
            let element = AASeriesElement()
                .name(quoteSymbol.symbol)
                .data(data)
            return element
        }
        return series
    }
    
    func makeUIView(context: Context) -> some UIView {
        configureChartModel()
        chart.aa_drawChartWithChartModel(chartModel)
        return chart
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        configureChartModel()
        chart.aa_drawChartWithChartModel(chartModel)
    }
    
    @discardableResult
    func configureChartModel() -> ChartView {
        let colorHexStrings = chartContent.quoteSymbols.map { $0.colorHexString }
        let series = ChartView.getSeries(forChartContent: chartContent)
        
        chartModel = chartModel
            .chartType(.column)
            .animationType(.bounce)
            .title(chartContent.title)
            .subtitle(chartContent.subtitle)
            .dataLabelsEnabled(false)
            .tooltipValueSuffix(chartContent.tooltipValueSuffix)
            .categories(chartContent.categories)
            .colorsTheme(colorHexStrings)
            .series(series)
        
        return self
    }
    
    @discardableResult
    func subscribeForUpdates() -> ChartView {
        NotificationCenter.default.addObserver(forName: .didFetchMonthQuotes, object: nil, queue: .main) { _ in
            configureChartModel()
            chart.aa_drawChartWithChartModel(chartModel)
        }
        return self
    }
    
    // MARK: Private Function
}
