//
//  SwipeActionView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 05/04/25.
//


import SwiftUI

struct SwipeActionView: View {

    @State private var colorEffectProgress: CGFloat = 0
    @GestureState private var dragOffset: CGSize = .zero
    @State private var positionOffset: CGFloat = 0
    @State private var maxOffset: CGFloat = 0

    @Binding var swipe: SwipeAction
    let thumbSize: CGFloat
    let thumbColor: Color
    let thumbTint: Color
    let backgroundColor: Color
    let textColor: Color
    let defaultText: String
    let progressText: String
    let completeText: String
    let action: (SwipeAction) -> Void

    init(swipe: Binding<SwipeAction>,
         thumbSize: CGFloat = 60,
         thumbColor: Color = .white,
         thumbTint: Color = .red,
         backgroundColor: Color = .red,
         textColor: Color = .white,
         defaultText: String,
         progressText: String,
         completeText: String,
         action: @escaping (SwipeAction) -> Void) {
        _swipe = swipe
        
        self.thumbSize = thumbSize
        self.thumbColor = thumbColor
        self.thumbTint = thumbTint
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        
        self.defaultText = defaultText
        self.progressText = progressText
        self.completeText = completeText
        self.action = action
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: thumbSize / 2.5)
                    .fill(backgroundColor)
                    .frame(height: thumbSize)
                    .shadow(radius: 2)
                    .overlay(trackText())

                HStack {
                    RoundedRectangle(cornerRadius: thumbSize / 2.5)
                        .fill(thumbColor)
                        .frame(width: thumbSize, height: thumbSize)
                        .shadow(radius: 2)
                        .overlay(thumbIcon())
                        .offset(x: positionOffset)
                        .gesture(
                            DragGesture()
                                .updating($dragOffset, body: { value, state, _ in
                                    state = value.translation
                                })
                                .onChanged { value in
                                    let newOffset = value.translation.width
                                    if newOffset.isFinite && newOffset >= 0 {
                                        positionOffset = min(newOffset, maxOffset)
                                    }
                                }
                                .onEnded { value in
                                    let newOffset = value.translation.width
                                    let shouldComplete = newOffset > maxOffset / 2
                                    
                                    withAnimation(.easeOut(duration: 0.2)) {
                                        positionOffset = shouldComplete ? maxOffset : 0
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                        swipe = shouldComplete ? .progress : .none
                                    }
                                }
                        )
                        .animation(.linear, value: dragOffset)

                    Spacer()
                }
            }
            .onAppear {
                maxOffset = geo.size.width - thumbSize
            }
        }
        .frame(height: thumbSize)
        .onChange(of: swipe) { oldValue, newValue in
            action(newValue)
            if newValue == .none {
                positionOffset = 0
            }
        }
    }
    
    func thumbIcon() -> some View {
        Group {
            switch swipe {
            case .none:
                Image(systemName: "chevron.forward.2")
                    .modifier(BreathEffectModifier())
            case .progress:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: thumbTint))
            case .completed:
                Image(systemName: "trash")
                    .modifier(BreathEffectModifier())
            }
        }
        .font(.system(size: 16, weight: .semibold))
        .foregroundStyle(thumbTint)
    }
    
    func trackText() -> some View {
        let text: String = {
            switch swipe {
            case .none: return defaultText
            case .progress: return progressText
            case .completed: return completeText
            }
        }()

        return Text(text)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(textColor)
            .applyColorEffect(progress: $colorEffectProgress, from: textColor, to: textColor.opacity(0.5))
    }
    
}

extension SwipeActionView {
    enum SwipeAction: String {
        case none
        case progress
        case completed
    }
}

#Preview {
    SwipeActionView(
        swipe: Binding.constant(.none),
        defaultText: "Swipe to Delete Account",
        progressText: "Deleting Account",
        completeText: "Account Deleted") { action in
            
        }
}
