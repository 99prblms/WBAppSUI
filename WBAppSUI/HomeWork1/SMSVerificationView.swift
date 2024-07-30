//
//  SMSVerificationView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 10.07.2024.
//

import SwiftUI

struct SMSVerificationData {
    var code: [String]
    var phoneNumber: String
}

struct SMSVerificationView: View {
    @State private var verificationData: SMSVerificationData
    
    init(phoneNumber: String) {
        _verificationData = State(initialValue: SMSVerificationData(code: ["", "", "", ""], phoneNumber: phoneNumber))
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Введите код")
                .font(.system(size: 24))
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            
            Text("Отправили код на номер")
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
            
            Text("+7 " + verificationData.phoneNumber)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            
            HStack(spacing: 10) {
                ForEach(0..<4, id: \.self) { index in
                    TextField("", text: $verificationData.code[index])
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.center)
                        .frame(width: 50, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .onChange(of: verificationData.code[index]) { newValue in
                            if newValue.count > 1 {
                                verificationData.code[index] = String(newValue.prefix(1))
                            }
                        }
                }
            }
            
            Text("Запросить код повторно")
                .foregroundColor(Color.purple)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}

struct SMSVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        SMSVerificationView(phoneNumber: "999 999-99-99")
    }
}
