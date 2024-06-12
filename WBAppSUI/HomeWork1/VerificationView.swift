//
//  VerificationView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 06.06.2024.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        VStack(spacing: 10) {
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
        }
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
