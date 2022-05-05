//
//  stocks_test_appTests.swift
//  stocks-test-appTests
//
//  Created by vladimir.kuzomenskyi on 06.05.2022.
//

import XCTest
@testable import stocks_test_app

class stocks_test_appTests: XCTestCase {
    func testCalculatingPercentageIncrease() throws {
        let result0 = PercentageCalculator.shared.percentageDecreaseOrIncrease(from: 100, to: 100)
        let result1 = PercentageCalculator.shared.percentageDecreaseOrIncrease(from: 100, to: 110)
        let result2 = PercentageCalculator.shared.percentageDecreaseOrIncrease(from: 100, to: 120)
        
        XCTAssertEqual(result0, 0)
        XCTAssertEqual(result1, 10)
        XCTAssertEqual(result2, 20)
    }
}
