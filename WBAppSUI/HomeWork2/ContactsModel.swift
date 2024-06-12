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
    Contacts(name: "Анастасия Иванова", lastSeen: "Last seen yesterday", isOnline: false, stories: false, imageName: "ContatcsPic"),
    Contacts(name: "Петя", lastSeen: "Online", isOnline: true, stories: false, imageName: "ContatcsPic"),
    Contacts(name: "Маман", lastSeen: "Last seen 3 hours ago", isOnline: false, stories: true, imageName: "ContatcsPic"),
    Contacts(name: "Арбуз Дыня", lastSeen: "Online", isOnline: true, stories: false, imageName: "ContatcsPic"),
    Contacts(name: "Иван Иванов", lastSeen: "Online", isOnline: true, stories: false, imageName: "ContatcsPic"),
    Contacts(name: "Лиса Алиса", lastSeen: "Last seen 30 minutes ago", isOnline: false, stories: true, imageName: "ContatcsPic")
]
