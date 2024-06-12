//
//  TabBarView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 09.06.2024.
//

import SwiftUI

struct TabBarView: View {
    @State var selectTab = "1"
    
    var body: some View {
        
        ZStack() {
            VStack {
                Spacer()
                switch selectTab {
                case "1":
                    ContactsView(path: listContacts)
                case "2":
                    Text("Chats")
                case "3":
                    Text("More")
                default:
                    ContactsView(path: listContacts)
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        selectTab = "1"
                    }) {
                        VStack {
                            selectTab == "1" ? Image(.tabBarContactsPic) : Image(.tabBarContacts)
                        }
                    }
                    Spacer()
                    Button(action: {
                        selectTab = "2"
                    }) {
                        VStack {
                            selectTab == "2" ? Image(.tabBarChatsPic) : Image(.tabBarChats)
                        }
                    }
                    Spacer()
                    Button(action: {
                        selectTab = "3"
                    }) {
                        VStack {
                            selectTab == "3" ? Image(.tabBarMorePiс) : Image(.tabBarMore)
                        }
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
    }
}
#Preview {
    TabBarView()
}
