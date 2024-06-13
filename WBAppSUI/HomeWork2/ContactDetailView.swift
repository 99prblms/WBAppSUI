//
//  SwiftUIView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 10.06.2024.
//
import SwiftUI

struct ContactDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var contact: Contact
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(250)
                .offset(CGSize(width: 0, height: -140))
            VStack {
                Text(contact.name)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .frame(width: 400)
                    .fontWeight(.bold)
                    .offset(CGSize(width: 0, height: -100))
                
                Text("+7-999-99-99-909")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .foregroundColor(.gray)
                    .offset(CGSize(width: 0, height: -90))
            }
            HStack {
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
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(.backArrowPic)
                        .resizable()
                        .frame(width: 7.42, height: 12.02)
                    Text("Профиль")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(.editPic)
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContactDetailView(contact: listContacts[0])
        }
    }
}
