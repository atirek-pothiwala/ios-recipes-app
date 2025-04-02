//
//  TextFieldModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    private var background: Color
    
    init(background: Color = .black.opacity(0.15)) {
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .regular))
            .foregroundStyle(.white)
            .tint(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 35)
            .padding()
            .background(background, in: .buttonBorder)
    }
}
