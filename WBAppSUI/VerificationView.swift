//
//  VerificationView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 06.06.2024.
//

import SwiftUI

struct VerificationView: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        
        VStack(spacing: 70) {
            
            Image(.onBoardPic)
                .resizable()
                .frame(width: 300, height: 300)
            
            Text("Верификация тут")
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
        }
    }
}

struct Verification_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
