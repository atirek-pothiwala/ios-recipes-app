//
//  TextFieldModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    private var background: Color
    private var textColor: Color
    private var hintColor: Color
    
    init(textColor: Color = .white, hintColor: Color = .white, background: Color = .black.opacity(0.15)) {
        self.textColor = textColor
        self.hintColor = hintColor
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .regular))
            .foregroundStyle(textColor)
            .tint(hintColor)
            .frame(maxWidth: .infinity)
            .frame(height: 35)
            .padding()
            .background(background, in: .buttonBorder)
    }
}
