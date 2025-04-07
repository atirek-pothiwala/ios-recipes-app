//
//  ColorEffectModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI
import UIKit

/*
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
        .onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                animate = true
            }
        }
    }
}
 
*/

struct ColorEffectModifier: AnimatableModifier {
    var progress: CGFloat
    let primary: Color
    let secondary: Color

    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }

    func body(content: Content) -> some View {
        let from = UIColor(primary).rgba
        let to = UIColor(secondary).rgba
        
        let red = from.red + (to.red - from.red) * progress
        let green = from.green + (to.green - from.green) * progress
        let blue = from.blue + (to.blue - from.blue) * progress
        let alpha = from.alpha + (to.alpha - from.alpha) * progress
        
        return content.foregroundColor(Color(red: red, green: green, blue: blue, opacity: alpha))
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
}

extension View {
    func applyColorEffect(progress: Binding<CGFloat>, from primary: Color, to secondary: Color) -> some View {
        self.modifier(ColorEffectModifier(progress: progress.wrappedValue, primary: primary, secondary: secondary))
            .onAppear {
                if progress.wrappedValue == 0 {
                    withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                        progress.wrappedValue = 1
                    }
                }
            }
    }
}
