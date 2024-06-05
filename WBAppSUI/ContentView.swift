//
//  ContentView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 05.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Image(.onBoardPic)
                .resizable()
                .frame(width: 300, height: 300)
            
            Text("Общайтесь с друзьями и близкими легко")
                .padding()
                .font(.title)
            
            Button("Пользовательское соглашение") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet) {
                Text("Тут будет пользовательское соглашение")
                    .presentationDetents([.large, .medium, .fraction(0.75)])
            }
            Button("Начать общаться") {
            }
            .buttonStyle(.borderedProminent)
            .tint(.accentColor)
            .cornerRadius(20)
            .frame(width: 200, height: 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
