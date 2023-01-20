//
//  Date+Extension.swift
//  GitHub Followers
//
//  Created by Eugene Ned on 20.01.2023.
//

import Foundation


extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
