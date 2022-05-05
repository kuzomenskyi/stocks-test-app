//
//  QuotesManager.swift
//  stocks-test-app
//
//  Created by vladimir.kuzomenskyi on 05.05.2022.
//

import Foundation

class QuotesManager: NSObject {
    // MARK: Constant
    
    // MARK: Private Constant
    private let monthQuotesURL = Bundle.main.url(forResource: "responseQuotesMonth", withExtension: "json")!
    private let weekQuotesURL = Bundle.main.url(forResource: "responseQuotesWeek", withExtension: "json")!
    
    // MARK: Variable
    
    // MARK: Private Variable
    
    // MARK: Init
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    func getMonthQuotes(successCompletion: @escaping (ResponseQuotesMonth) -> Void, failureCompletion: @escaping (Error) -> Void) {
        getData(fromJSONAt: monthQuotesURL) { data in
            do {
                let monthQuotes = try JSONDecoder().decode(ResponseQuotesMonth.self, from: data)
                successCompletion(monthQuotes)
            } catch {
                failureCompletion(error)
            }
        } failureCompletion: { error in
            failureCompletion(error)
        }
    }
    
    func getWeekQuotes(successCompletion: @escaping (ResponseQuotesWeek) -> Void, failureCompletion: @escaping (Error) -> Void) {
        getData(fromJSONAt: weekQuotesURL) { data in
            do {
                let weekQuotes = try JSONDecoder().decode(ResponseQuotesWeek.self, from: data)
                successCompletion(weekQuotes)
            } catch {
                failureCompletion(error)
            }
        } failureCompletion: { error in
            failureCompletion(error)
        }
    }
    
    // MARK: Private Function
    private func getData(fromJSONAt url: URL, successCompletion: @escaping (Data) -> Void, failureCompletion: @escaping (Error) -> Void) {
        do {
            let data = try Data(contentsOf: url)
            successCompletion(data)
        } catch {
            failureCompletion(error)
        }
    }
}
