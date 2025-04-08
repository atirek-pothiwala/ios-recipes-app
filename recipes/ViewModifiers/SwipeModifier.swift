//
//  SwipeModifier.swift
//  recipes
//
//  Created by Atirek Pothiwala on 24/03/25.
//

import SwiftUI

typealias OnSwipe = (_ direction: SwipeDirection) -> Void

enum SwipeDirection: Hashable {
    case left
    case right
    case normal
}

struct SwipeModifier: ViewModifier {
    
    let threshold: CGFloat
    @Binding var direction: SwipeDirection
    let onSwipe: OnSwipe
    
    init(threshold: CGFloat = 200, direction: Binding<SwipeDirection>, _ onSwipe: @escaping OnSwipe) {
        self.threshold = threshold
        _direction = direction
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
                            changeDirection(value.translation.width)
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
            onSwipe(.normal)
            direction = .normal
        }
    }
    
    func changeDirection(_ value: CGFloat) {
        if value < -threshold / 3 {
            direction = .left
        } else if value > threshold / 3 {
            direction = .right
        } else {
            direction = .normal
        }
    }
}
