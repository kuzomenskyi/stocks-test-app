//
//  Date+Ext.swift
//  
//
//  Created by vladimir.kuzomenskyi on 27.04.2022.
//

import Foundation

extension Date {
    static var placeholderDate = Date.getDate(year: 1)
    
    static func getDate(year: Int, month: Int = 1, day: Int = 1, hr: Int = 0, min: Int = 0, sec: Int = 0) -> Date {
        var calendar = Calendar.current
        calendar.timeZone = .current
        let components = DateComponents(year: year, month: month, day: day, hour: hr, minute: min, second: sec)
        return calendar.date(from: components)!
    }
    
    static func getAllMonthsInYear(_ year: Int) -> [Date] {
        var output = [Date]()
        
        for month in 1...12 {
            let date = Date.getDate(year: year, month: month)
            output.append(date)
        }
        
        return output
    }
    
    func addDays(_ days: Int) -> Date {
        let cal = Calendar.current
        let output = cal.date(byAdding: .day, value: days, to: self)!
        return output
    }

    func firstDayOfTheMonth() -> Date {
        let dateComponents = Calendar.current.dateComponents([.year,.month], from: self)
                                                             
        let output = Calendar.current.date(from: dateComponents)!
        return output
    }

    func getAllDaysInMonth() -> [Date] {
        var days = [Date]()

        let calendar = Calendar.current

        let range = calendar.range(of: .day, in: .month, for: self)!

        var day = firstDayOfTheMonth()

        for _ in 1...range.count {
            days.append(day)
            day = day.addDays(1)
        }

        return days
    }
    
    func getDayTitle() -> String {
        return DateManager.shared.getDayTitle(fromDate: self)
    }
}
