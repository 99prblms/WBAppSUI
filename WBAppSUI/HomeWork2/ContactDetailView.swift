//
//  SwiftUIView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 10.06.2024.
//

import SwiftUI

struct ContactDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack() {
            Image(.changeAvatar)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(250)
                .offset(CGSize(width: 0, height: -140))
            VStack() {
                Text("Иван Иванов")
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .frame(width: 400)
                    .fontWeight(.bold)
                    .offset(CGSize(width: 0, height: -100))

                Text("+7999-999-99-99")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .foregroundColor(.gray)
                    .offset(CGSize(width: 0, height: -90))
            }
            HStack() {
                Image(.twitterPic)
                    .resizable()
                    .frame(width: 72, height: 40)
                Image(.instaPic)
                    .resizable()
                    .frame(width: 72, height: 40)
                Image(.linkedInPic)
                    .resizable()
                    .frame(width: 72, height: 40)
                Image(.faceBookPic)
                    .resizable()
                    .frame(width: 72, height: 40)
            }
            .offset(CGSize(width: 0, height: -50))

        }

    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView()
    }
}
