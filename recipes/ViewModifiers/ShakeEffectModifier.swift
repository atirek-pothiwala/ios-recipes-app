//
//  ShakeEffectModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 05/04/25.
//


import SwiftUI

struct ShakeEffect: GeometryEffect {
    var travelDistance: CGFloat = 10
    var shakesPerUnit: Double = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let translation = travelDistance * sin(animatableData * Double.pi * shakesPerUnit)
        return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
    }
}

struct ShakeEffectModifier: ViewModifier {
    var duration: Double = 0.8
    var distance: CGFloat = 2
    var shakesPerUnit: Double = 3

    @State private var shakeTrigger: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .modifier(ShakeEffect(travelDistance: distance, shakesPerUnit: shakesPerUnit, animatableData: shakeTrigger))
            .onAppear {
                withAnimation(.easeInOut(duration: duration).repeatForever(autoreverses: true)) {
                    shakeTrigger = 1
                }
            }
    }
}

extension View {
    func betterShake(duration: Double = 0.6, distance: CGFloat = 8, shakesPerUnit: Double = 4) -> some View {
        self.modifier(ShakeEffectModifier(duration: duration, distance: distance, shakesPerUnit: shakesPerUnit))
    }
}
