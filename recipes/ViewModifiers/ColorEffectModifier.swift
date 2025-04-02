//
//  ColorEffectModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct ColorEffectModifier: ViewModifier {
    
    private var color: Color
    @Binding private var animate: Bool
    
    init(_ animate: Binding<Bool>, _ color: Color) {
        _animate = animate
        self.color = color
    }
    
    func body(content: Content) -> some View {
        content
        .foregroundStyle(animate ? color : Color.black)
        .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true), value: animate)
    }
}
