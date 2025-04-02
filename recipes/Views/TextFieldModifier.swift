//
//  TextFieldModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .regular))
            .foregroundStyle(.white)
            .tint(.white)
            .frame(maxWidth: .infinity, minHeight: 40)
            .padding()
            .background(.black.opacity(0.15), in: .buttonBorder)
    }
}
