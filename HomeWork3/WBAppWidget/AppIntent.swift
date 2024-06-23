//
//  AppIntent.swift
//  WBAppWidget
//
//  Created by Владислав Наумов on 16.06.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
}
