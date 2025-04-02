//
//  ColorEffectModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct ColorEffectModifier: ViewModifier {
    
    private var color: Color
    @State private var animate: Bool = false
    
    init(_ color: Color) {
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
        .foregroundStyle(animate ? color : Color.black)
        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animate)
        .onAppear {
            withTransaction(Transaction(animation: nil)) {
                animate = true
            }
        }
    }
}
