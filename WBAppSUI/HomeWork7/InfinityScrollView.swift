//
//  InfinityScrollView.swift
//  WBAppSUI
//
//  Created by Владислав Наумов on 04.07.2024.
//

import SwiftUI

struct EmojiCellView: View {
    var body: some View {
        ZStack {
            HStack(spacing: 10) {
                RoundedShape(size: randomSize())
                RoundedShape(size: randomSize())
                RoundedShape(size: randomSize())
            }
            Text(generateRandomEmoji())
                .font(.system(size: 50))
                .opacity(0.5)
        }
    }
    
    func randomSize() -> CGSize {
        Bool.random() ? CGSize(width: 50, height: 50) : CGSize(width: 50, height: 100)
    }
    
    func generateRandomEmoji() -> String {
        let unicodeScalars = (0x1F300...0x1F3F0).map { UnicodeScalar($0)! }
        return String(unicodeScalars.randomElement()!)
    }
}

struct RoundedShape: View {
    var size: CGSize
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
            .frame(width: size.width, height: size.height)
    }
}

struct InfiniteEmojiScrollView: View {
    @State private var items: [Int] = Array(0..<100)
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<items.count, id: \.self) { index in
                    EmojiCellView()
                        .padding()
                        .onAppear {
                            if index == items.count - 1 {
                                addMoreItems()
                            }
                        }
                }
            }
            .padding()
        }
    }
    
    private func addMoreItems() {
        let startingPoint = items.count
        let newItems = Array(startingPoint..<(startingPoint + 100))
        items.append(contentsOf: newItems)
    }
}

#Preview {
    InfiniteEmojiScrollView()
}
