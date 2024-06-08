//
//  SwiftUIView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 08.06.2024.
//

import SwiftUI

struct CustomButtonView: View {
    
    let text: String
    var body: some View {
        Text(text)
            .frame(width: 327, height: 50)
            .background(Color.accentColor)
            .cornerRadius(30)
    }
}

//#Preview {
//    CustomButtonView(text: <#T##String#>, action: <#T##() -> Void#>)
//}
