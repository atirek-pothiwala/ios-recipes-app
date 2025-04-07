//
//  LogoView.swift
//  recipes
//
//  Created by Atirek Pothiwala on 23/03/25.
//

import SwiftUI

struct LogoView: View {
    
    var ratio: Double
    
    init(ratio: Double = 1.25) {
        self.ratio = ratio
    }
    
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(maxWidth: .infinity)
                .aspectRatio(ratio, contentMode: .fit)
            
                HStack(alignment: .center, spacing: 15) {
                    Image.init("logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: .white, radius: 5)
            
                    VStack(alignment: .center, spacing: 0) {
                        Text("Recipes")
                            .font(.system(size: 35, weight: .semibold))
                            .foregroundStyle(Color.white)
                            .shadow(color: .black, radius: 10)
                        
                        Text("By Knight Chef")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(.white)
                            .shadow(color: .black, radius: 10)
                    }
                
            }
            .modifier(BreathEffectModifier())
        }
    }
}

#Preview {
    LogoView()
        .padding(.all, 32)
        .background(Color.accent)
}
