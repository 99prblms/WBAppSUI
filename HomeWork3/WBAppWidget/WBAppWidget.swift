//
//  WBAppWidget.swift
//  WBAppWidget
//
//  Created by Владислав Наумов on 16.06.2024.
//

import WidgetKit
import SwiftUI

struct ContactProvider: AppIntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contact: Contact.example(), configuration: ConfigurationAppIntent())
    }
    
    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        let contact = listContacts.first ?? Contact.placeholder()
        return SimpleEntry(date: Date(), contact: contact, configuration: configuration)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        var entryDate = currentDate
        
        for _ in 0 ..< 5 {
            let contact = listContacts.randomElement() ?? Contact.placeholder()
            let entry = SimpleEntry(date: entryDate, contact: contact, configuration: configuration)
            entries.append(entry)
            
            entryDate = Calendar.current.date(byAdding: .second, value: 5, to: entryDate)!
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            WidgetCenter.shared.reloadTimelines(ofKind: "WBAppWidget")
        }
        return timeline
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contact: Contact
    let configuration: ConfigurationAppIntent
}

struct WBAppWidget: Widget {
    let kind: String = "WBAppWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: ContactProvider()) { entry in
            WBAppWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Мой виджет")
        .description("Это пример виджета.")
    }
}

struct WBAppWidget_Previews: PreviewProvider {
    static var previews: some View {
        WBAppWidgetEntryView(entry: SimpleEntry(date: Date(), contact: Contact.example(), configuration: ConfigurationAppIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
