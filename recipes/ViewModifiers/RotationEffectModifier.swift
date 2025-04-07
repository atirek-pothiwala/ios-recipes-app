//
//  RotationEffectModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

struct RotationEffectModifier: ViewModifier {
    @State private var animate: Bool = false
        
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(animate ? 360 : 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: false)) {
                    animate = true
                }
            }
    }
}
