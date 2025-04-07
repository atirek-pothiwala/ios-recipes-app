//
//  SwipeModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

typealias OnSwipe = (_ direction: SwipeDirection) -> Void

enum SwipeDirection: String {
    case left = "left"
    case right = "right"
}

struct SwipeModifier: ViewModifier {
    
    let threshold: CGFloat
    let onSwipe: OnSwipe
    @Binding var color: Color
    
    init(threshold: CGFloat = 200, color: Binding<Color>, _ onSwipe: @escaping OnSwipe) {
        self.threshold = threshold
        _color = color
        self.onSwipe = onSwipe
    }
    
    @GestureState private var dragOffset: CGSize = .zero
    @State private var positionOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        let totalOffset = positionOffset + dragOffset.width
        let rotationAngle = Angle(degrees: Double(totalOffset / 40))
        
        content
            .offset(x: totalOffset)
            .rotationEffect(rotationAngle)
            .gesture(
                DragGesture()
                    .updating($dragOffset, body: { value, state, _ in
                        state = value.translation
                    })
                    .onChanged({ value in
                        withAnimation(.spring) {
                            changeColor(value.translation.width)
                        }
                    })
                    .onEnded { value in
                        withAnimation(.spring) {
                            animateSwipe(value.translation.width)
                        }
                    }
            )
            .animation(.spring(), value: dragOffset)
    }
    
    func animateSwipe(_ value: CGFloat) {
        if value < -threshold {
            positionOffset = -500
            onSwipe(.left)
        } else if value > threshold {
            positionOffset = 500
            onSwipe(.right)
        } else {
            positionOffset = 0
        }
    }
    
    func changeColor(_ value: CGFloat) {
        if value < -threshold {
            color = .red.opacity(0.5)
        } else if value > threshold {
            color = .green.opacity(0.5)
        } else {
            color = .clear
        }
    }
}
