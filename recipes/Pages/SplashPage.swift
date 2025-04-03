//
//  SplashPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 22/03/25.
//

import SwiftUI

struct SplashPage: View {
        
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                Spacer()
                
                LogoView()
                
                Spacer()
                
                btnGetStarted
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.accentColor)
            .safeAreaPadding()
        }
    }
    
    var btnGetStarted: some View {
        NavigationLink {
            if Constants.shared.token.isEmpty {
                LoginPage()
            } else {
                TabPage()
            }
        } label: {
            Image(systemName: "chevron.right")
                .modifier(ColorEffectModifier(.red))
        }
        .font(.system(size: 24, weight: .bold))
        .padding(.all, 24)
        .background(.white, in: .circle)
    }
}

#Preview {
    SplashPage()
}
