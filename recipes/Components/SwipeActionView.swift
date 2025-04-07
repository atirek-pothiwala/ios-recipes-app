//
//  SwipeToUnlockButton.swift
//  recipes
//
//  Created by Atirek Pothiwala on 05/04/25.
//


import SwiftUI

struct SwipeActionView: View {
    @State private var offset: CGFloat = 0
    @State private var maxOffset: CGFloat = 0
    @State private var invoked = false
    
    let thumbSize: CGFloat = 60
    let thumbColor: Color = .white
    let thumbTint: Color = .red
    let backgroundColor: Color = .red
    let textColor: Color = .white
    let defaultText: String
    let actionText: String
    let onAction: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: thumbSize / 2)
                .fill(backgroundColor)
                .frame(height: thumbSize)
                .shadow(radius: 2)
                .overlay(
                    Text(invoked ? actionText : defaultText)
                        .modifier(
                            ColorEffectModifier(
                                textColor, textColor.opacity(0.5)
                            )
                        )
                        .font(.system(size: 16, weight: .bold))
                )

            HStack {
                Circle()
                    .fill(thumbColor)
                    .frame(width: thumbSize, height: thumbSize)
                    .shadow(radius: 2)
                    .overlay(
                        Image(systemName: "chevron.forward.2")
                            .foregroundStyle(thumbTint)
                            .font(.system(size: 20, weight: .semibold))
                    )
                    .offset(x: offset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                if gesture.translation.width >= 0 {
                                    offset = min(gesture.translation.width, maxOffset)
                                }
                            }
                            .onEnded { gesture in
                                if offset > maxOffset / 2 {
                                    // Trigger invoked
                                    withAnimation {
                                        offset = maxOffset
                                        invoked = true
                                    }
                                    onAction()
                                } else {
                                    // Snap back
                                    withAnimation {
                                        offset = 0
                                    }
                                }
                            }
                    )

                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .renderSize { size in
            maxOffset = size.width - thumbSize
        }
    }
}

#Preview {
    SwipeActionView(
        defaultText: "Swipe to Delete Account", 
        actionText: "Account Deleted"
    ) {
        
    }
}
