//
//  ContactsModel.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 12.06.2024.
//

import Foundation

public struct Contacts: Hashable {
    let id = UUID()
    let name: String
    let lastSeen: String
    let isOnline: Bool
    let stories: Bool
    let imageName: String
}

public var listContacts: [Contacts] = [
    Contacts(name: "Анастасия Иванова", lastSeen: "Last seen yesterday", isOnline: false, stories: false, imageName: "AnastasiaPic"),
    Contacts(name: "Петя", lastSeen: "Online", isOnline: true, stories: false, imageName: "PetyaPic"),
    Contacts(name: "Маман", lastSeen: "Last seen 3 hours ago", isOnline: false, stories: true, imageName: "MamanPic"),
    Contacts(name: "Арбуз Дыня", lastSeen: "Online", isOnline: true, stories: false, imageName: "ArbuzPic"),
    Contacts(name: "Иван Иванов", lastSeen: "Online", isOnline: true, stories: false, imageName: "NonPic"),
    Contacts(name: "Лиса Алиса", lastSeen: "Last seen 30 minutes ago", isOnline: false, stories: true, imageName: "NonPic")
]

// Функция для получения инициалов из имени контакта
func initials(for name: String) -> String {
    let components = name.split(separator: " ")
    let initials = components.reduce("") { (result, component) in
        guard let firstCharacter = component.first else { return result }
        return result + String(firstCharacter)
    }
    return initials
}
