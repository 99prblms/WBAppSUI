//
//  ContactsView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 09.06.2024.
//

import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let status: String
}

let sampleContacts = [
    Contact(name: "Анастасия Иванова", status: "Last seen yesterday"),
    Contact(name: "Петя", status: "Online"),
    Contact(name: "Маман", status: "Last seen 3 hours ago"),
    Contact(name: "Арбуз Дыня", status: "Online"),
    Contact(name: "Иван Иванов", status: "Online"),
    Contact(name: "Лиса Алиса", status: "Last seen 30 minutes ago")
]

struct ContactRow: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Image(.contatcsPic)
                .resizable()
                .frame(width: 48, height: 48)
                .offset(x: -15, y: 0)
            
            Image(.statusPic)
                .resizable()
                .frame(width: 15, height: 15)
                .offset(x: -32, y: -20)
            
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.headline)
                    .offset(x: 0, y: 0)
                Text(contact.status)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .offset(x: 0, y: 10)
            }
            Spacer()
        }
        .padding()
    }
}

struct ContactsView: View {
    var body: some View {
        NavigationView {
            List(sampleContacts) { contact in
                ContactRow(contact: contact)
                    .frame(height: 68)
            }
            .navigationTitle("Контакты")
        }
    }
}

#Preview {
    ContactsView()
}
