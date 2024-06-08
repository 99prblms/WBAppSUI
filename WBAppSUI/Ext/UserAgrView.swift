//
//  UserAgrView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 08.06.2024.
//

import SwiftUI

struct UserAgrView: View {
    @Binding var showSheet: Bool
    
    var body: some View {
        VStack {
            Text("Тут будет пользовательское соглашение")
                .padding()
            
            Button("Прочитал") {
                showSheet = false
            }
            .padding()
        }
    }
}
