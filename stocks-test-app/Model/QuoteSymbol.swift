//
//  QuoteSymbol.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import Foundation

struct QuoteSymbol: Codable {
    enum CodingKeys: String, CodingKey {
        case symbol = "symbol", timestamps, opens, closures
        case highs, lows, volumes
    }
    
    // MARK: Constant
    var symbol: String = ""
    var timestamps: [Int] = []
    var opens = [Double]()
    var closures = [Double]()
    var highs = [Double]()
    var lows: [Double] = []
    var volumes: [Int] = []
    var colorHexString = ""
    
    var opensPerformance: [Double] {
        let output = opens.enumerated().map { (index, number) -> Double in
            let isPreviousValueExists = opens.indices.contains(index - 1)
            
            if isPreviousValueExists {
                let previousNumber = opens[index - 1]
                let output = PercentageCalculator.shared.percentageDecreaseOrIncrease(from: previousNumber, to: number)
                return output
            } else {
                return 0
            }
        }
        return output
    }
    
    var opensPerformanceStrings: [String] {
        return opensPerformance.map { "\($0)%" }
    }
    
    var opensWithPerformanceStrings: [String] {
        let output = Array(zip(opens, opensPerformanceStrings)).map { "\($0) \($1)" }
        return output
    }
    
    // MARK: Private Constant
    
    // MARK: Variable
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    init(from decoder: Decoder) throws {
        self.colorHexString = RandomColorGenerator.shared.generateRandomColor()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decodeIfPresent(String.self, forKey: .symbol) ?? ""
        self.timestamps = try container.decodeIfPresent([Int].self, forKey: .timestamps) ?? []
        self.opens = try container.decodeIfPresent([Double].self, forKey: .opens) ?? []
        self.closures = try container.decodeIfPresent([Double].self, forKey: .closures) ?? []
        self.highs = try container.decodeIfPresent([Double].self, forKey: .highs) ?? []
        self.lows = try container.decodeIfPresent([Double].self, forKey: .lows) ?? []
        self.volumes = try container.decodeIfPresent([Int].self, forKey: .volumes) ?? []
        
        
    }
    
    // MARK: Private Function
}
