//
//  BreathEffectModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct BreathEffectModifier: ViewModifier {
    @State private var animate: Bool = false
        
    func body(content: Content) -> some View {
        content
            .scaleEffect(animate ? 1.25 : 1)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animate)
            .onAppear {
                withTransaction(Transaction(animation: nil)) {
                    animate = true
                }
            }
    }
}
