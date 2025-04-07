import SwiftUI

struct ContinuousShakeModifier: ViewModifier {
    var amount: CGFloat = 10
    var shakesPerUnit: CGFloat = 3
    var speed: Double = 0.6

    @State private var animValue: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .modifier(ContinuousShakeEffect(animatableData: animValue, amount: amount, shakesPerUnit: shakesPerUnit))
            .onAppear {
                withAnimation(.linear(duration: speed).repeatForever(autoreverses: false)) {
                    animValue = 1_000
                }
            }
    }

    private struct ContinuousShakeEffect: GeometryEffect {
        var animatableData: CGFloat
        var amount: CGFloat
        var shakesPerUnit: CGFloat

        func effectValue(size: CGSize) -> ProjectionTransform {
            let translation = amount * sin(animatableData * .pi * shakesPerUnit)
            return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
        }
    }
}
