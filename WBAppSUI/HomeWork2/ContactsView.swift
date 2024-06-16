//
//  ContactsView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 09.06.2024.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var searchText = ""
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
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
                        HStack {
                            ZStack {
                                if contact.avatar {
                                    Image(contact.imageName)
                                        .resizable()
                                        .frame(width: 48, height: 48)
                                } else {
                                    Text(getInitials(name: contact.name))
                                        .font(.system(size: 18))
                                        .frame(width: 48, height: 48)
                                        .background(Color.WB)
                                        .foregroundColor(.white)
                                        .cornerRadius(14)
                                }

                                if contact.isOnline {
                                    Image("StatusPic")
                                        .resizable()
                                        .frame(width: 17, height: 17)
                                        .offset(x: 18, y: -19)
                                }
                                
                                if contact.stories {
                                    Image("StoriesPic")
                                        .resizable()
                                        .frame(width: 55, height: 55)
                                }
                            }
                            .padding(.trailing, 10)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text(contact.name)
                                    .font(.system(size: 14))
                                Text(contact.lastSeen)
                                    .font(.system(size: 12))
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .padding(.vertical, 5)
                        .onTapGesture {
                            path.append(contact)
                        }
                    }
                }
                .navigationDestination(for: Contact.self) { contact in
                    ContactDetailView(contact: contact)
                }
            }
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
