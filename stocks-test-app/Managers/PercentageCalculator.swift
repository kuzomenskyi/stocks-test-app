//
//  PercentageCalculator.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 06.05.2022.
//

import Foundation

class PercentageCalculator: NSObject {
    // MARK: Constant
    
    // MARK: Private Constant
    
    // MARK: Variable
    static var shared = PercentageCalculator()
    
    // MARK: Private Variable
    private override init() {}
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    func percentageDecreaseOrIncrease(from value1: Double, to value2: Double) -> Double {
        let diff = (value2 - value1) / value1
        return Double(round(100 * (diff * 100)) / 100)
    }
    
    // MARK: Private Function
}
