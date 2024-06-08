//
//  WalkthroughtView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 08.06.2024.
//

import SwiftUI

struct WalkthroughtView: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 70) {
                Image(.onBoardPic)
                    .resizable()
                    .frame(width: 262, height: 271)
                    .offset(x: 0, y: 50)
                
                Text("Общайтесь с друзьями и близкими легко")
                    .padding()
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .frame(width: 400)
                    .fontWeight(.bold)
                
                VStack(spacing: 30) {
                    Button("Пользовательское соглашение") {
                        showSheet.toggle()
                    }
                    .foregroundColor(Color.black)
                    .offset(x: 0, y: 70)
                    .sheet(isPresented: $showSheet) {
                        UserAgrView(showSheet: $showSheet)
                    }
                    
                    NavigationLink(destination: VerificationView()) {
                        Text("Начать общаться")
                            .frame(width: 327, height: 50)
                            .background(Color.accentColor)
                            .foregroundColor(Color.white)
                            .cornerRadius(30)
                    }
                    .offset(x: 0, y: 60)
                }
            }
        }
    }
}

struct WalkthroughtView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughtView()
    }
}

