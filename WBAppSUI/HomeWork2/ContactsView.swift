//
//  ContactsView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 09.06.2024.
//

import SwiftUI

struct ContactRow: View {
    
    @State private var searchText = ""
    @State var path: [Contacts]
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search", text: $searchText)
                    .padding(.leading, 50)
                    .frame(height: 36)
                    .cornerRadius(4)
                    .background(Color("SearchBarColor"))
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .padding(.leading)
                            Spacer()
                        }
                    )
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Контакты")
                                .font(.system(size: 18))
                                .bold()
                                .padding()
                            Spacer()
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {}) {
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                            }
                            .padding()
                        }
                    }
                
                List {
                    ForEach(listContacts.filter { searchText.isEmpty ? true : $0.name.contains(searchText) }, id: \.self) { contact in
                        NavigationLink(value: contact) {
                            HStack {
                                Image(contact.imageName)
                                    .resizable()
                                    .frame(width: 48, height: 48)
                                    .padding(.trailing, 10)
                                    .overlay(
                                        HStack {
                                            if contact.isOnline {
                                                Image("StatusPic")
                                                    .resizable()
                                                    .frame(width: 17, height: 17)
                                                    .offset(CGSize(width: 18, height: -19))
                                            }
                                            if contact.stories {
                                                Image("StoriesPic")
                                                    .resizable()
                                                    .frame(width: 55, height: 55)
                                                    .offset(CGSize(width: -5, height: 0))
                                            }
                                        }
                                    )
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(contact.name)
                                        .font(.system(size: 14))
                                    Text(contact.lastSeen)
                                        .font(.system(size: 12))
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                }
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(path: listContacts)
    }
}
