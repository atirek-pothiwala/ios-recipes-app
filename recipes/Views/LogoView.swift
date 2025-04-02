//
//  LogoView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import SwiftUI

struct LogoView: View {
    
    var aspectRatio: Double
    
    init(aspectRatio: Double = 1.25) {
        self.aspectRatio = aspectRatio
    }
    
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(maxWidth: .infinity)
                .aspectRatio(aspectRatio, contentMode: .fit)
            
            VStack(alignment: .center) {
                Text("Recipes")
                    .foregroundStyle(.white)
                    .font(.system(size: 50, weight: .black))
                
                Text("By Knightislive")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .semibold))
            }
            .modifier(BreathEffectModifier())
        }
    }
}

#Preview {
    LogoView()
        .padding(.all, 32)
        .background(Color.accentColor)
}
