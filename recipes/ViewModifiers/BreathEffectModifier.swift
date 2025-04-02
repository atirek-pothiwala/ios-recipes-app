//
//  BreathEffectModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct BreathEffectModifier: ViewModifier {
    @Binding private var animate: Bool
    
    init(_ animate: Binding<Bool>) {
        _animate = animate
    }
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(animate ? 1.25 : 1)
            .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true), value: animate)
    }
}
