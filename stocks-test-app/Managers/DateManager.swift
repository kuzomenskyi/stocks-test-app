//
//  DateManager.swift
//  
//
//  Created by vladimir.kuzomenskyi on 29.04.2022.
//

import Foundation

class DateManager: NSObject {
    enum FirstDayOfWeek {
        case monday, sunday
    }
    
    // MARK: Constant
    
    // MARK: Private Constant
    
    // MARK: Variable
    static var shared = DateManager()
    
    // MARK: Private Variable
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        return formatter
    }()
    
    // MARK: Init
    private override init() {
        super.init()
    }
    
    // MARK: Action
    
    // MARK: Private Action
    
    // MARK: Function
    func getMonthTitle(fromDate date: Date) -> String {
        dateFormatter.dateFormat = "LLLL"
        let output = dateFormatter.string(from: date).capitalized
        return output
    }
    
    func getYear(fromDate date: Date) -> Int {
        dateFormatter.dateFormat = "YYYY"
        return Int(dateFormatter.string(from: date))!
    }
    
    func getMonthInt(fromDate date: Date) -> Int {
        dateFormatter.dateFormat = "MM"
        return Int(dateFormatter.string(from: date))!
    }
    
    func getDayInt(fromDate date: Date) -> Int {
        dateFormatter.dateFormat = "dd"
        return Int(dateFormatter.string(from: date))!
    }
    
    /// Returns day title, uppercased. E.g. WED for Wednesday
    /// - Parameter date: Date to get day title from
    /// - Returns: String. Day title
    func getDayTitle(fromDate date: Date) -> String {
        dateFormatter.dateFormat = "E"
        let output = dateFormatter.string(from: date).uppercased()
        return output
    }
    
    func getMonthsTitles() -> [String] {
        let monthsDates: [Date] = {
            var output = [Date]()
            
            for monthNumber in 1...12 {
                let date = Date.getDate(year: 2022, month: monthNumber)
                output.append(date)
            }
            return output
        }()
        
        let monthsTitles: [String] = {
            var output = [String]()
            
            for monthDate in monthsDates {
                let monthTitle = DateManager.shared.getMonthTitle(fromDate: monthDate)
                output.append(monthTitle)
            }
            
            return output
        }()
        
        return monthsTitles
    }
    
    func getDayTitles(forFirstDayOfWeek firstDayOfWeek: DateManager.FirstDayOfWeek) -> [String] {
        let newDayTitles: [String] = {
            let mondayTitle = Date.getDate(year: 2022, month: 4, day: 4).getDayTitle()
            let tuesdayTitle = Date.getDate(year: 2022, month: 4, day: 5).getDayTitle()
            let wednesdayTitle = Date.getDate(year: 2022, month: 4, day: 6).getDayTitle()
            let thursdayTitle = Date.getDate(year: 2022, month: 4, day: 7).getDayTitle()
            let fridayTitle = Date.getDate(year: 2022, month: 4, day: 8).getDayTitle()
            let saturdayTitle = Date.getDate(year: 2022, month: 4, day: 9).getDayTitle()
            let sundayTitle = Date.getDate(year: 2022, month: 4, day: 10).getDayTitle()
            
            switch firstDayOfWeek {
            case .monday:
                return [
                    mondayTitle, tuesdayTitle, wednesdayTitle, thursdayTitle, fridayTitle, saturdayTitle, sundayTitle
                ]
            case .sunday:
                return [
                    sundayTitle, mondayTitle, tuesdayTitle, wednesdayTitle, thursdayTitle, fridayTitle, saturdayTitle
                ]
            }
        }()
        return newDayTitles
    }
    
    // MARK: Private Function
}
