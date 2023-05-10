//
//  Date+Extensions.swift
//  Movies_SwiftUI_Combine_MVVM
//
//  Created by Евгений  on 10/05/2023.
//

import Foundation

extension Date {
    
    static var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    static func getYear(from string: String) -> String {
        let date = formatter.date(from: string) ?? Date()
        let year = String(Calendar.current.component(.year, from: date))
        return year
    }
}
