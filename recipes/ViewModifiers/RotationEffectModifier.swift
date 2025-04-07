//
//  ColorEffectModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct ColorEffectModifier: ViewModifier {
    
    private var primary: Color
    private var secondary: Color
    @State private var animate: Bool = false
    
    init(_ primary: Color, _ secondary: Color) {
        self.primary = primary
        self.secondary = secondary
    }
    
    func body(content: Content) -> some View {
        content
        .foregroundStyle(animate ? primary : secondary)
        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animate)
        .onAppear {
            withTransaction(Transaction(animation: nil)) {
                animate = true
            }
        }
    }
}
