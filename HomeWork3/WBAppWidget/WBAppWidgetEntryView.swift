//
//  WBAppWidgetEntryView.swift
//  WBAppWidgetExtension
//
//  Created by Владислав Наумов on 23.06.2024.
//

import Foundation
import SwiftUI

struct WBAppWidgetEntryView: View {
    var entry: ContactProvider.Entry
    
    var body: some View {
           VStack {
               Text(entry.contact.name)
               
               if entry.contact.imageName == "NonPic" {
                   Text(getInitials(name: entry.contact.name))
                       .font(.largeTitle)
                       .frame(width: 110, height: 110)
                       .background(Color.WB)
                       .cornerRadius(38)
               } else {
                   Image(entry.contact.imageName)
                       .resizable()
                       .frame(width: 110, height: 110)
               }
           }
           .containerBackground(for: .widget) {
               Color("BackgroundColor")
           }
       }
   }
