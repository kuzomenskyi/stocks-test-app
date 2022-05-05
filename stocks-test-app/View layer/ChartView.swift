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
    @State var chartModel = AAChartModel()
    var chart = AAChartView()
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    func makeUIView(context: Context) -> some UIView {
        chart.aa_drawChartWithChartModel(chartModel)
        return chart
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let series = getSeries()
        chart.aa_onlyRefreshTheChartDataWithChartModelSeries(series)
    }
    
    @discardableResult
    func configureChartModel() -> ChartView {
        let colorHexStrings = chartContent.quoteSymbols.map { $0.colorHexString }
        let series = getSeries()
        
        chartModel
            .chartType(.column)
            .animationType(.bounce)
            .title(chartContent.title)
            .subtitle(chartContent.subtitle)
            .dataLabelsEnabled(true)
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
        }
        return self
    }
    
    func getSeries() -> [AASeriesElement] {
        let series = chartContent.quoteSymbols.map { quoteSymbol -> AASeriesElement in
            let element = AASeriesElement()
                .name(quoteSymbol.symbol)
                .data(quoteSymbol.volumes)
            return element
        }
        return series
    }
    
    // MARK: Private Function
}
