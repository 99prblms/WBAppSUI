//
//  StringIntepolationView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 26.06.2024.
//

import Foundation
import SwiftUI

struct StringInterpolationView: View {
    @State private var selectedDate = Date()
    @State private var selectedLanguage = 0
    @State private var spellOutNumbers = false

    private let languages = ["en", "es", "fr", "de", "ru"]
    private let flags = ["🇺🇸", "🇪🇸", "🇫🇷", "🇩🇪", "🇷🇺"]

    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            Picker("Language", selection: $selectedLanguage) {
                ForEach(flags.indices, id: \.self) { index in
                    Text(flags[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Toggle("Spell out numbers", isOn: $spellOutNumbers)
                .padding()

            VStack(alignment: .leading) {
                Text(dateString(for: Calendar.current.date(byAdding: .day, value: -2, to: selectedDate) ?? Date()))
                Text(dateString(for: Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? Date()))
                Text(dateString(for: selectedDate))
                    .bold()
                    .foregroundColor(.blue)
                Text(dateString(for: Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? Date()))
                Text(dateString(for: Calendar.current.date(byAdding: .day, value: 2, to: selectedDate) ?? Date()))
            }
            .padding()
        }
    }

    func dateString(for date: Date) -> String {
        let locale = Locale(identifier: languages[selectedLanguage])
        let dayDifference = Calendar.current.dateComponents([.day], from: selectedDate, to: date).day

        switch dayDifference {
        case -2:
            return "Day before yesterday: \(date: date, in: locale, format: .full, spellOut: spellOutNumbers)"
        case -1:
            return "Yesterday: \(date: date, in: locale, format: .full, spellOut: spellOutNumbers)"
        case 0:
            return "Today: \(date: date, in: locale, format: .full, spellOut: spellOutNumbers)"
        case 1:
            return "Tomorrow: \(date: date, in: locale, format: .full, spellOut: spellOutNumbers)"
        case 2:
            return "Day after tomorrow: \(date: date, in: locale, format: .full, spellOut: spellOutNumbers)"
        default:
            return "\(date: date, in: locale, format: .full, spellOut: spellOutNumbers)"
        }
    }
}

struct StringInterpolationView_prew: PreviewProvider {
    static var previews: some View {
        StringInterpolationView()
    }
}
