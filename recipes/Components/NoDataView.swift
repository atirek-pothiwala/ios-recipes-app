//
//  ImageView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 04/04/25.
//

import SwiftUI

typealias OnReload = () -> Void

struct NoDataView: View {
    
    static let emojis: [String] = [
        "🥘",
        "🍲",
        "🍔",
        "🍟",
        "🍕",
        "🍳",
        "🍛",
        "🍜",
        "🥚",
        "🌯"
    ]
    static var randomEmoji: String {
        return emojis.randomElement() ?? "🍽️"
    }
    
    let text: String
    let color: Color
    let onReload: OnReload?
    
    init(text: String? = nil, color: Color = Color.accent, onReload: OnReload? = nil) {
        self.text = text ?? "We will find some recipes\nfor you soon."
        self.color = color
        self.onReload = onReload
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(NoDataView.randomEmoji)
                .font(.system(size: 75))
            Text(text)
                .font(.system(size: 20, weight: .medium))
                .multilineTextAlignment(.center)
                .foregroundStyle(color)
            
            if onReload != nil {
                Button {
                    onReload?()
                } label: {
                    VStack(alignment: .center, spacing: 10) {
                        Image(systemName: "arrow.clockwise.icloud.fill")
                            .font(.system(size: 40, weight: .regular))
                        Text("Tap here to try again.")
                            .font(.system(size: 16, weight: .regular))
                    }
                }
                .foregroundStyle(Color.gray)
                .offset(y: 50)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    NoDataView() {
        
    }
}
