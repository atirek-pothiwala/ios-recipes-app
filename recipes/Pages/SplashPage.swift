//
//  SplashPage.swift
//  recipes
//
//  Created by Atirek Pothiwala on 22/03/25.
//

import SwiftUI

struct SplashPage: View {
    
    @EnvironmentObject var navigator: Navigator
    @State private var colorEffectProgress: CGFloat = 0
        
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            LogoView()
            
            Spacer()
            
            btnGetStarted
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.accent)
        .safeAreaPadding()
    }
    
    var btnGetStarted: some View {
        Button {
            if Constants.shared.token.isEmpty {
                navigator.push(Route.login)
            } else {
                navigator.push(Route.dashboard)
            }
        } label: {
            Image(systemName: "chevron.right")
                .applyColorEffect(progress: $colorEffectProgress, from: .red, to: .black)
        }
        .font(.system(size: 24, weight: .bold))
        .padding(.all, 24)
        .background(.white, in: .circle)
    }
}
