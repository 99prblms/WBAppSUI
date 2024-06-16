//
//  ContactsModel.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 12.06.2024.
//

import Foundation

public struct Contact: Hashable {
    let id = UUID()
    let name: String
    let lastSeen: String
    let isOnline: Bool
    let stories: Bool
    let imageName: String
    let avatar: Bool
}

public var listContacts: [Contact] = [
    Contact(name: "Анастасия Иванова", lastSeen: "Last seen yesterday", isOnline: false, stories: false, imageName: "AnastasiaPic", avatar: true),
    Contact(name: "Петя", lastSeen: "Online", isOnline: true, stories: false, imageName: "PetyaPic", avatar: true),
    Contact(name: "Маман", lastSeen: "Last seen 3 hours ago", isOnline: false, stories: true, imageName: "MamanPic", avatar: true),
    Contact(name: "Арбуз Дыня", lastSeen: "Online", isOnline: true, stories: false, imageName: "ArbuzPic", avatar: true),
    Contact(name: "Иван Иванов", lastSeen: "Online", isOnline: true, stories: false, imageName: "", avatar: false),
    Contact(name: "Лиса Алиса", lastSeen: "Last seen 30 minutes ago", isOnline: false, stories: true, imageName: "", avatar: false)
]

public func getInitials(name: String) -> String {
    let components = name.split(separator: " ")
    let initials = components.reduce("") { (result, component) in
        guard let firstCharacter = component.first else { return result }
        return result + String(firstCharacter)
    }
    return initials
}
