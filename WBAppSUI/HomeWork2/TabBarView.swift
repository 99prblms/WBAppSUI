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
        
        ZStack(alignment: .bottom) {
            TabView(selection: $selectTab) {
                Text("Contacts")
//                ContactsView()
                    .tag("1")
                    .tabItem {
                        Image(.tabBarContactsPic)
                    }
                Text("Chats")
                    .tag("2")
                    .tabItem {
                        Image(.tabBarChatsPic)
                    }
                Text("More")
                    .tag("3")
                    .tabItem {
                        Image(.tabBarMorePic)
                    }
            }
            HStack {
                Button {
                    selectTab = "1"
                } label: {
                    HStack {
                        Image(.tabBarContactsPic)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 65)
        .background(.gray)
    }
}

#Preview {
    TabBarView()
}
