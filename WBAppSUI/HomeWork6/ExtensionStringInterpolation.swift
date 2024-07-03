//
//  ExtensionStringInterpolation.swift.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 26.06.2024.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(date: Date, in locale: Locale, format: DateFormatter.Style, spellOut: Bool) {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateStyle = format
        formatter.timeStyle = .none

        if spellOut {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .spellOut
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let month = calendar.monthSymbols[calendar.component(.month, from: date) - 1]
            let year = calendar.component(.year, from: date)
            let spelledOutDate = "\(numberFormatter.string(from: NSNumber(value: day))!) \(month) \(numberFormatter.string(from: NSNumber(value: year))!)"
            appendLiteral(spelledOutDate)
        } else {
            appendLiteral(formatter.string(from: date))
        }
    }
}
