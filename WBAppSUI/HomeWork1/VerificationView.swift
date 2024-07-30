//
//  VerificationView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 06.06.2024.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var phoneNumber: String = ""
    @State private var buttonOpacity = 1.0
    @State private var navigate = false
    @State private var showProgress = false
    @State private var hideContent = false

    var body: some View {
        VStack(spacing: 20) {
            if !hideContent {
                Text("Введите номер телефона")
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .frame(width: 400)
                    .fontWeight(.bold)
                    .offset(x: 0, y: -160)
                
                Text("Мы вышлем код подтверждения на указанный номер")
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .offset(x: 0, y: -160)
                
                HStack(spacing: 10) {
                    Image("flagPic")
                        .frame(width: 24, height: 24)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(3.0)
                    Text("+7")
                    
                    TextField("000 000-00-00", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .onChange(of: phoneNumber) { newValue in
                            
                            if newValue.count > 10 {
                                phoneNumber = String(newValue.prefix(10))
                            }
                        }
                        .frame(width: 200)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .offset(y: -150)
            }
            
            if navigate {
                NavigationLink(destination: SMSVerificationView(phoneNumber: phoneNumber), isActive: $navigate) {
                    EmptyView()
                }
            }
            
            if showProgress {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .offset(y: -140)
            } else {
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        buttonOpacity = 0.0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            hideContent = true
                            showProgress = true
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        navigate = true
                    }
                }) {
                    Text("Продолжить")
                        .frame(width: 327, height: 50)
                        .background(phoneNumber.count == 10 ? Color.purple : Color.gray)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                        .opacity(buttonOpacity)
                }
                .disabled(phoneNumber.count != 10)
                .offset(y: -140)
            }
        }
        .animation(.easeInOut, value: showProgress)
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
