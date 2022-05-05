//
//  QuoteSymbol.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import Foundation

struct QuoteSymbol: Codable {
    let symbol: String
    let timestamps: [Int]
    let opens, closures, highs, lows: [Double]
    let volumes: [Int]
}
